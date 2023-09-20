part of 'index.dart';

@RoutePage()
class ReflectionPage extends StatelessWidget {
  const ReflectionPage(this.reflection, this.questions, {super.key});

  final Reflection reflection;

  final List<String> questions;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
