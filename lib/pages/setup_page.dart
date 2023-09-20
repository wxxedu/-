part of 'index.dart';

@RoutePage()
class SetupPage extends HookWidget {
  const SetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final initialText =
        useMemoized(() => GetIt.I<Box>().get(kOpenAiApiKey) ?? '', []);
    final text = useRef(initialText);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'OpenAI API Key',
                  hintText: 'Your OpenAI API Key',
                ),
                obscureText: true,
                initialValue: initialText,
                onChanged: (value) => text.value = value,
              ),
              const Spacer(),
              FilledButton.tonal(
                onPressed: () async {
                  final router = AutoRouter.of(context);
                  await GetIt.I<Box>().put(kOpenAiApiKey, text.value);
                  while (router.canPop()) {
                    await router.pop();
                  }
                  router.push(const ReflectionModelsListRoute());
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
