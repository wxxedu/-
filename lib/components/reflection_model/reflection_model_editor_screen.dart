part of 'index.dart';

@RoutePage()
class ReflectionModelEditorScreen extends HookWidget {
  const ReflectionModelEditorScreen(
    this.model, {
    super.key,
    this.onSave,
    this.onDelete,
    this.allowAdd = false,
  });

  final ReflectionModel model;

  final bool allowAdd;

  final FutureOr<void> Function(ReflectionModel)? onSave;

  final FutureOr<void> Function(ReflectionModel)? onDelete;

  @override
  Widget build(BuildContext context) {
    final canAddFuture = useMemoized(() => model.canAddQuestion());
    final canAddSnapshot = useFuture(canAddFuture);
    final canAdd = canAddSnapshot.hasData ? canAddSnapshot.data! : false;
    final name = useState(model.name);
    final prompt = useState(model.prompt);
    final questions = useState(model.questions);
    useEffect(() {
      name.addListener(() {
        model.name = name.value;
      });
      prompt.addListener(() {
        model.prompt = prompt.value;
      });
      questions.addListener(() {
        model.questions = questions.value;
      });
      return null;
    }, [model]);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Model Details',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            TextFormField(
              maxLines: null,
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Enter the name of the model',
              ),
              initialValue: model.name,
              onChanged: (value) => name.value = value,
            ),
            const SizedBox(height: 8),
            TextFormField(
              maxLines: null,
              decoration: const InputDecoration(
                labelText: 'Prompt',
                hintText:
                    'Enter the prompt for the model, this is fed to GPT as the '
                    'system message',
              ),
              initialValue: model.prompt,
              onChanged: (value) => prompt.value = value,
            ),
            const SizedBox(height: 8),
            if (canAdd)
              Row(
                children: [
                  Text(
                    'Questions',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      questions.value = [...questions.value, ''];
                    },
                  ),
                ],
              ),
            Expanded(
              child: ListView(
                children: [
                  for (int i = 0; i < questions.value.length; i++)
                    Column(
                      children: [
                        TextFormField(
                          initialValue: questions.value[i],
                          maxLines: null,
                          onChanged: (value) {
                            questions.value = [
                              ...questions.value.sublist(0, i),
                              value,
                              ...questions.value.sublist(i + 1),
                            ];
                          },
                          decoration: InputDecoration(
                            labelText: 'Question ${i + 1}',
                            hintText: 'Enter Question ${i + 1}',
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () async {
                    final isar = GetIt.I<Isar>();
                    final messenger = ScaffoldMessenger.of(context);
                    await model.links.load();
                    await isar.writeTxn(() async {
                      for (final reflection in model.links) {
                        await isar.reflections.delete(reflection.id);
                      }
                      await isar.reflectionModels.delete(model.id);
                    });
                    messenger.showSnackBar(
                      SnackBar(
                        content: Text('Deleted ${model.name}'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                    onDelete?.call(model);
                  },
                  child: const Text('Delete'),
                ),
                const SizedBox(width: 8),
                FilledButton.tonal(
                  onPressed: () async {
                    final messenger = ScaffoldMessenger.of(context);
                    final isar = GetIt.I<Isar>();
                    onSave?.call(model);
                    await isar.writeTxn(() async {
                      await isar.reflectionModels.put(model);
                    });
                    messenger.showSnackBar(
                      SnackBar(
                        content: Text('Saved ${model.name}'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
