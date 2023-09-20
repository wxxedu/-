part of 'index.dart';

@RoutePage()
class ReflectionModelPage extends HookWidget {
  const ReflectionModelPage(this.model, {super.key});

  final ReflectionModel model;

  @override
  Widget build(BuildContext context) {
    final current = useState(0);
    final controller = useTabController(initialLength: 2);
    final progress = useState<(int, int)?>(null);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final messenger = ScaffoldMessenger.of(context);
            final path = await FilePicker.platform.getDirectoryPath();
            if (path == null) {
              messenger.showSnackBar(
                const SnackBar(
                  content: Text('No path selected'),
                  duration: Duration(seconds: 1),
                ),
              );
              return;
            }
            final filePath = p.join(path, 'reflections.md');
            await model.exportToMarkdown(filePath);
            messenger.showSnackBar(
              SnackBar(
                content: Text('Exported to $filePath'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
          child: const Icon(Icons.save),
        ),
        appBar: AppBar(
          title: Text('${model.name}'),
          bottom: TabBar(
            controller: controller,
            tabs: const [
              Tab(icon: Icon(Icons.book)),
              Tab(icon: Icon(Icons.edit)),
            ],
            onTap: (value) => current.value = value,
          ),
          actions: [
            IconButton(
              onPressed: () async {
                // show date picker
                final messenger = ScaffoldMessenger.of(context);
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (date == null) {
                  messenger.showSnackBar(
                    const SnackBar(
                      content: Text('No date selected'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                  return;
                }
                final reflection = await model.newReflection(
                    createdAt: date, progressNotifier: progress);
                messenger.showSnackBar(
                  SnackBar(
                    content: Text('Created Reflection ${reflection.id}'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: progress.value == null
            ? Column(
                children: [
                  if (current.value == 0)
                    Expanded(
                      child: ReflectionModelDisplayScreen(model),
                    ),
                  if (current.value == 1)
                    Expanded(
                      child: SingleChildScrollView(
                        child: ReflectionModelEditorScreen(model),
                      ),
                    ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(
                          value: (progress.value!.$1 + 1).toDouble() /
                              (progress.value!.$2 + 1).toDouble(),
                        )
                            .animate(
                                onPlay: (controller) => controller.repeat(
                                    period: const Duration(seconds: 1)))
                            .rotate(),
                        const SizedBox(height: 8),
                        Text('${progress.value!.$1} / ${progress.value!.$2}'),
                      ],
                    ),
                  ),
                ],
              ));
  }
}
