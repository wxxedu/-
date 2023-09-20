part of 'index.dart';

@collection
class ReflectionModel {
  Id id = Isar.autoIncrement;

  late String name;

  late String prompt;

  DateTime createdAt = DateTime.now();

  List<String> questions = [];

  @Backlink(to: 'model')
  IsarLinks<Reflection> links = IsarLinks<Reflection>();

  static final Logger logger = Logger('ReflectionModel');

  static Future<ReflectionModel> create({
    required String name,
    required String prompt,
    List<String>? questions,
    Isar? isar,
  }) async {
    isar ??= GetIt.I<Isar>();
    final model = ReflectionModel();
    model.prompt = prompt;
    model.name = name;
    model.questions = questions ?? [];
    final modelId =
        await isar.writeTxn(() => isar!.reflectionModels.put(model));
    model.id = modelId;
    return model;
  }

  Future<Reflection> newReflection({
    Isar? isar,
    OpenAiGenerator? generator,
    DateTime? createdAt,
  }) async {
    isar ??= GetIt.I<Isar>();
    final reflection = await Reflection.create(isar: isar);
    reflection.model.value = this;
    await isar.writeTxn(() => reflection.model.save());

    generator ??= GetIt.I<OpenAiGenerator>();
    final openAi = generator.getOrCrash();
    final messages = await _getAllMessages();
    for (int i = 0; i < questions.length; i++) {
      final question = questions[i];
      messages.add(Messages(role: Role.user, content: "${i + 1}. $question"));
      final request = ChatCompleteText(
        model: GptTurboChatModel(),
        messages: messages,
      );
      final response = await openAi.onChatCompletion(request: request);
      final answer = response?.choices.first.message?.content;
      if (answer != null) {
        logger.info(
            'Got answer for the ${i + 1}th question "$question": \n\t$answer');
        reflection.answers.add(answer);
        messages.add(Messages(role: Role.assistant, content: answer));
      } else {
        logger.warning('No answer for ${i + 1} question "$question"');
        reflection.answers.add('');
        messages.add(Messages(role: Role.assistant, content: ''));
      }
    }
    logger
        .info('Got data from GPT, saving reflection with id ${reflection.id}');
    await isar.writeTxn(() => isar!.reflections.put(reflection));
    return reflection;
  }

  static Future<List<ReflectionModel>> load({Isar? isar}) async {
    isar ??= GetIt.I<Isar>();
    return isar.reflectionModels.where().sortByCreatedAt().findAll();
  }

  Future<List<Messages>> _getAllMessages() async {
    final res = <Messages>[];
    await links.load();
    for (final reflection in links) {
      // format the date
      final date = DateFormat('yyyy-MM-dd').format(reflection.createdAt);
      res.add(
        Messages(
          role: Role.assistant,
          content: 'You are now writing for $date',
        ),
      );
      res.addAll(_getMessagesForReflection(reflection));
    }
    return res;
  }

  List<Messages> _getMessagesForReflection(Reflection reflection) {
    final res = <Messages>[];
    for (int i = 0; i < questions.length; i++) {
      final question = questions[i];
      res.add(Messages(role: Role.user, content: question));
      final answer = reflection.answers[i];
      res.add(Messages(role: Role.assistant, content: answer));
    }
    return res;
  }
}
