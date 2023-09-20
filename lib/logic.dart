import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:fu/openai.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@LazySingleton()
class Logic {
  Isar isar;
  OpenAiGenerator openai;
  OpenAI get openAI =>
      openai().fold((l) => throw UnimplementedError(), (r) => r);
  Logic(this.isar, this.openai);
}
