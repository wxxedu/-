part of 'index.dart';

@RoutePage()
class ReflectionModelEditorScreen extends StatelessWidget {
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
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              initialValue: model.name,
              onChanged: (value) => name.value = value,
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Prompt'),
              initialValue: model.prompt,
              onChanged: (value) => prompt.value = value,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Questions'),
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
                          onChanged: (value) {
                            questions.value = [
                              ...questions.value.sublist(0, i),
                              value,
                              ...questions.value.sublist(i + 1),
                            ];
                          },
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                ],
              ),
            ),
            Row(
              children: [
                const Spacer(),
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
                    onSave?.call(model);
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
