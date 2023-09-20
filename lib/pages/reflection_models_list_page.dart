part of 'index.dart';

@RoutePage()
class ReflectionModelsListPage extends HookWidget {
  const ReflectionModelsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final reloadKey = useState(UniqueKey());
    final modelsFuture =
        useMemoized(() => ReflectionModel.load(), [reloadKey.value]);
    final models = useFuture(modelsFuture);
    if (models.hasError) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text('Error: ${models.error}')),
      );
    } else if (!models.hasData) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(child: CircularProgressIndicator.adaptive()),
      );
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => AutoRouter.of(context).push(const SetupRoute()),
          icon: const Icon(Icons.settings),
        ),
        title: const Text('Reflection Models'),
        actions: [
          IconButton(
            onPressed: () async {
              // show dialog
              showDialog(
                context: context,
                builder: (context) {
                  return CreateReflectionModelDialog(
                    onCreated: (model) {
                      reloadKey.value = UniqueKey();
                      AutoRouter.of(context).push(
                        ReflectionModelRoute(model: model),
                      );
                    },
                  );
                },
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ReflectionModelsList(models.data!),
    );
  }
}
