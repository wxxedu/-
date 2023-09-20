part of 'index.dart';

@RoutePage()
class ReflectionEditorScreen extends HookWidget {
  const ReflectionEditorScreen(this.reflection, this.questions, {super.key});

  final Reflection reflection;

  final List<ReflectionQuestion> questions;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
