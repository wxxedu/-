part of 'index.dart';

@RoutePage()
class ReflectionModelPage extends StatelessWidget {
  const ReflectionModelPage(this.model, {super.key});

  final ReflectionModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.name),
      ),
      body: ReflectionModelDisplayScreen(model),
    );
  }
}
