part of 'index.dart';

@embedded
class MessagesData {
  @enumerated
  Role role = Role.user;
  String content = '';

  MessagesData();

  @ignore
  Messages get message => Messages(
        role: role,
        content: content,
      );
}

@embedded
class ReflectionQuestion {
  String displayText = '';

  List<MessagesData> data = [];

  @ignore
  List<Messages> get messages => data.map((e) => e.message).toList();
}
