part of 'index.dart';

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async => GetIt.I.init();

@module
abstract class Injection {
  @preResolve
  Future<Box> get box async {
    await Hive.initFlutter();
    return await Hive.openBox('fu');
  }

  @preResolve
  Future<Isar> get isar async {
    final directory = await getApplicationDocumentsDirectory();
    final dbPath = p.join(directory.path);
    return await Isar.open(
      [ReflectionModelSchema, ReflectionSchema],
      directory: dbPath,
    );
  }
}
