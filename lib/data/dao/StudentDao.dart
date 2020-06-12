
import 'package:edufy/data/models/Students.dart';
import 'package:edufy/data/models/Students.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'StudentDao.g.dart';
// Denote which tables this DAO can access
@UseDao(tables: [Students])
class StudentDao extends DatabaseAccessor<AppDatabase> with _$StudentDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  StudentDao(this.db) : super(db);

  Future<List<Student>> getAllStudents() => select(students).get();
  Stream<List<Student>> watchAllStudents() => select(students).watch();
  Future insertStudent(Insertable<Student> student) => into(students).insert(student);
Future updateStudent(Insertable<Student> student) => update(students).replace(student);
Future deleteStudent(Insertable<Student> student) => delete(students).delete(student);

Future<List<Student>> finduserByUsername(String username) {
  return (select(students)..where((student) => student.student_username.equals(username))).get();
}
}