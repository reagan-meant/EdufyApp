
import 'package:edufy/data/models/Students.dart';
import 'package:edufy/data/models/Students.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
// Denote which tables this DAO can access
@UseDao(tables: [Students])
class StudentDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  StudentDao(this.db) : super(db);

  Future<List<Student>> getAllTasks() => select(students).get();
  Stream<List<Student>> watchAllTasks() => select(students).watch();
  Future insertTask(Insertable<Student> student) => into(students).insert(student);
Future updateTask(Insertable<Student> student) => update(students).replace(student);
Future deleteTask(Insertable<Student> student) => delete(students).delete(student);
}