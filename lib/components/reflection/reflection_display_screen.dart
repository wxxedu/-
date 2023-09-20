part of 'index.dart';

@RoutePage()
class ReflectionDisplayScreen extends HookWidget {
  const ReflectionDisplayScreen(this.reflection, this.questions, {super.key});

  final Reflection reflection;

  final List<ReflectionQuestion> questions;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (int i = 0; i < questions.length; i++)
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Question ${i + 1}. ${questions[i].displayText}',
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 8),
                    Text(reflection.answers[i],
                        style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          )
      ],
    );
  }
}
