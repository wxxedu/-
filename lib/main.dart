import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

import 'utils/index.dart';

Future<void> main() async {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    late final String infoName;
    switch (record.level) {
      case Level.FINE:
        infoName = '\x1B[32m[FINE]\x1B[0m';
        break;
      case Level.INFO:
        infoName = '\x1B[34m[INFO]\x1B[0m';
        break;
      case Level.WARNING:
        infoName = '\x1B[33m[WARNING]\x1B[0m';
        break;
      case Level.SEVERE:
        infoName = '\x1B[31m[SEVERE]\x1B[0m';
        break;
      case Level.SHOUT:
        infoName = '\x1B[35m[SHOUT]\x1B[0m';
        break;
      default:
        infoName = '\x1B[34m[INFO]\x1B[0m';
    }
    // ignore: avoid_print
    print(
      '$infoName\x1B[36m[${record.loggerName}]\x1B[0m\x1B[33m[${record.time}]'
      '\x1B[0m ${record.message}',
    );
  });
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'F U',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: GetIt.I<AppRouter>().config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
