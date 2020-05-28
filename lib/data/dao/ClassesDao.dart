
import 'package:edufy/data/models/Classes.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
// Denote which tables this DAO can access
@UseDao(tables: [Classes])
class ClasseDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  ClasseDao(this.db) : super(db);

  Future<List<Classe>> getAllTasks() => select(classes).get();
  Stream<List<Classe>> watchAllTasks() => select(classes).watch();
  Future insertTask(Insertable<Classe> classe) => into(classes).insert(classe);
Future updateTask(Insertable<Classe> classe) => update(classes).replace(classe);
Future deleteTask(Insertable<Classe> classe) => delete(classes).delete(classe);
}