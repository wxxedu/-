part of 'index.dart';

class ReflectionModelsList extends HookWidget {
  const ReflectionModelsList(this.models, {super.key, this.onDelete});

  final List<ReflectionModel> models;

  final void Function(ReflectionModel)? onDelete;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (final model in models)
          ListTile(
            title: Text(model.name),
            subtitle: Text(model.prompt, maxLines: 1),
            onTap: () {
              AutoRouter.of(context).push(
                ReflectionModelRoute(model: model),
              );
            },
            // delete button
            trailing: IconButton(
              onPressed: () async {
                final isar = GetIt.I<Isar>();
                await isar.writeTxn(() async {
                  await isar.reflectionModels.delete(model.id);
                });
                onDelete?.call(model);
              },
              icon: const Icon(Icons.delete),
            ),
          ),
      ],
    );
  }
}
