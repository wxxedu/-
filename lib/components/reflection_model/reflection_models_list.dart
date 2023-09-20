part of 'index.dart';

class ReflectionModelsList extends HookWidget {
  const ReflectionModelsList(this.models, {super.key});

  final List<ReflectionModel> models;

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
          ),
      ],
    );
  }
}
