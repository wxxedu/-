part of 'index.dart';

@RoutePage()
class ReflectionDisplayScreen extends HookWidget {
  const ReflectionDisplayScreen(this.reflection, this.questions, {super.key});

  final Reflection reflection;

  final List<String> questions;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
