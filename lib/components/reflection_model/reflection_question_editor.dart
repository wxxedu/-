part of 'index.dart';

class ReflectionQuestionEditor extends HookWidget {
  const ReflectionQuestionEditor(
    this.question, {
    super.key,
    this.onDelete,
    required this.title,
  });

  final String title;

  final ReflectionQuestion question;

  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    final displayText = useState(question.displayText);
    final data = useState(question.data);
    useEffect(() {
      data.addListener(() {
        question.data = data.value;
      });
      displayText.addListener(() {
        question.displayText = displayText.value;
      });
      return null;
    }, [question]);
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    maxLines: null,
                    decoration: InputDecoration(
                      labelText: title,
                      hintText:
                          'Enter the display text of the question, it is this text '
                          'that will be used in the export.',
                    ),
                    initialValue: question.displayText,
                    onChanged: (value) => displayText.value = value,
                  ),
                  Container(
                    // left border
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Theme.of(context).colorScheme.tertiary,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        for (int i = 0; i < question.data.length; i++)
                          MessageDataEditor(
                            question.data[i],
                            onDelete: () {
                              data.value = [
                                ...data.value.sublist(0, i),
                                if (i + 1 < data.value.length)
                                  ...data.value.sublist(i + 1),
                              ];
                            },
                          ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final newData = MessagesData();
                      data.value = [...data.value, newData];
                    },
                    child: const Text('Add Message'),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (onDelete != null) const SizedBox(width: 8),
        // delete icon
        if (onDelete != null)
          IconButton(
            onPressed: onDelete,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
      ],
    );
  }
}

class MessageDataEditor extends HookWidget {
  const MessageDataEditor(this.data, {super.key, this.onDelete});

  final MessagesData data;

  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    final content = useState(data.content);
    final role = useState(data.role);
    useEffect(() {
      content.addListener(() {
        data.content = content.value;
      });
      role.addListener(() {
        data.role = role.value;
      });
      return null;
    }, [data]);

    void next() =>
        role.value = Role.values[(role.value.index + 1) % Role.values.length];

    final icon = useMemoized(() {
      switch (role.value) {
        case Role.system:
          return Icons.computer;
        case Role.assistant:
          return Icons.assistant;
        case Role.user:
          return Icons.person;
        case Role.function:
          return Icons.functions;
      }
    }, [role.value]);

    return Row(
      children: [
        SizedBox(
          width: 60,
          child: Column(
            children: [
              IconButton(
                onPressed: next,
                icon: Icon(icon),
              ),
              Text(
                role.value.toString().split('.').last.capitalized,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            maxLines: null,
            decoration: InputDecoration(
              labelText: role.value.toString().split('.').last.capitalized,
              hintText: 'Enter the content of the message',
            ),
            initialValue: data.content,
            onChanged: (value) => content.value = value,
          ),
        ),
        if (onDelete != null) const SizedBox(width: 8),
        // delete icon
        if (onDelete != null)
          IconButton(
            onPressed: onDelete,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
      ],
    );
  }
}
