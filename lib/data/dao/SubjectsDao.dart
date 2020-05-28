
import 'package:edufy/data/models/Subjects.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
// Denote which tables this DAO can access
@UseDao(tables: [Subjects])
class SubjectDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  SubjectDao(this.db) : super(db);

  Future<List<Subject>> getAllTasks() => select(subjects).get();
  Stream<List<Subject>> watchAllTasks() => select(students).watch();
  Future insertTask(Insertable<Subject> subject) => into(subjects).insert(subject);
Future updateTask(Insertable<Subject> subject) => update(subjects).replace(subject);
Future deleteTask(Insertable<Subject> subject) => delete(subjects).delete(subject);
}