part of 'index.dart';

class CreateReflectionModelDialog extends HookWidget {
  const CreateReflectionModelDialog({
    super.key,
    this.onCreated,
    this.onCancelled,
  });

  final void Function(ReflectionModel model)? onCreated;

  final void Function()? onCancelled;

  @override
  Widget build(BuildContext context) {
    final name = useRef('');
    final prompt = useRef('');
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                maxLines: null,
                onChanged: (value) => name.value = value,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'Name of the model',
                ),
              ),
              TextFormField(
                maxLines: null,
                onChanged: (value) => prompt.value = value,
                decoration: const InputDecoration(
                  labelText: 'Prompt',
                  hintText:
                      'Enter the prompt for the model, this is fed to GPT as the '
                      'system message',
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  // cancel
                  TextButton(
                    onPressed: () {
                      onCancelled?.call();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 8.0),
                  // create
                  FilledButton.tonal(
                    onPressed: () async {
                      final navigator = Navigator.of(context);
                      final model = await ReflectionModel.create(
                        name: name.value,
                        prompt: prompt.value,
                      );
                      onCreated?.call(model);
                      navigator.pop();
                    },
                    child: const Text('Create'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
