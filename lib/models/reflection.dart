part of 'index.dart';

@collection
class Reflection {
  Id id = Isar.autoIncrement;

  DateTime createdAt = DateTime.now();

  List<String> answers = [];

  IsarLink<ReflectionModel> model = IsarLink<ReflectionModel>();

  static Future<Reflection> create({
    Isar? isar,
    DateTime? createdAt,
  }) async {
    isar ??= GetIt.I<Isar>();
    final reflection = Reflection();
    if (createdAt != null) {
      reflection.createdAt = createdAt;
    }
    final refId = await isar.writeTxn(() => isar!.reflections.put(reflection));
    reflection.id = refId;
    return reflection;
  }
}
