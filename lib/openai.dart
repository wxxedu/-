import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dartz/dartz.dart';
import 'package:fu/failure.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

sealed class OpenAIFailure implements Failure {}

class OpenAITokenUnspecifiedFailure implements OpenAIFailure {}

@lazySingleton
class OpenAiGenerator {
  Either<OpenAIFailure, OpenAI> call([String? token]) => getOpenAI(token);
  Either<OpenAIFailure, OpenAI> getOpenAI([String? token]) {
    final box = GetIt.I.get<Box>();
    token ??= box.get('openai_token');
    if (token == null) {
      return left(OpenAITokenUnspecifiedFailure());
    }
    return right(OpenAI.instance.build(
      token: token,
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 120)),
      enableLog: true,
    ));
  }

  OpenAI getOrCrash([String? token]) =>
      call(token).fold((l) => throw UnimplementedError(), (r) => r);
}
