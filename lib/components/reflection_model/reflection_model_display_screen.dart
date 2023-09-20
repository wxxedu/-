part of 'index.dart';

@RoutePage()
class ReflectionModelDisplayScreen extends HookWidget {
  const ReflectionModelDisplayScreen(this.model, {super.key});

  final ReflectionModel model;

  @override
  Widget build(BuildContext context) {
    final key = useState(UniqueKey());
    final reflectionsFuture =
        useMemoized(() => model.links.load(), [key.value]);
    final reflections = useFuture(reflectionsFuture);
    if (reflections.hasError) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text(reflections.error.toString())),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.name,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          Text(
            model.prompt,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              children: [
                for (final ref in model.links)
                  ListTile(
                    leading: const Icon(Icons.note),
                    title: Text(
                      'Reflection created at '
                      '${DateFormat.yMd().format(ref.createdAt)}',
                    ),
                    onTap: () {
                      AutoRouter.of(context).push(
                        ReflectionRoute(
                          reflection: ref,
                          questions: model.questions,
                        ),
                      );
                    },
                    trailing: IconButton(
                      onPressed: () async {
                        final isar = GetIt.I<Isar>();
                        await isar.writeTxn(
                          () async {
                            await isar.reflections.delete(ref.id);
                          },
                        );
                        key.value = UniqueKey();
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
