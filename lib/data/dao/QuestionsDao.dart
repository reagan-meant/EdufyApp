
import 'package:edufy/data/models/Questions.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
// Denote which tables this DAO can access
@UseDao(tables: [Questions])
class QuestionDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  QuestionDao(this.db) : super(db);

  Future<List<Question>> getAllTasks() => select(questions).get();
  Stream<List<Question>> watchAllTasks() => select(questions).watch();
  Future insertTask(Insertable<Question> question) => into(questions).insert(question);
Future updateTask(Insertable<Question> question) => update(questions).replace(question);
Future deleteTask(Insertable<Question> question) => delete(questions).delete(question);
}