
import 'package:edufy/data/models/Questions.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'QuestionsDao.g.dart';
// Denote which tables this DAO can access
@UseDao(tables: [Questions])
class QuestionDao extends DatabaseAccessor<AppDatabase> with _$QuestionDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  QuestionDao(this.db) : super(db);

  Future<List<Question>> getAllQuestions() => select(questions).get();
  Stream<List<Question>> watchAllQuestions() => select(questions).watch();
  Future insertQuestion(Insertable<Question> question) => into(questions).insert(question);
Future updateQuestion(Insertable<Question> question) => update(questions).replace(question);
Future deleteQuestion(Insertable<Question> question) => delete(questions).delete(question);
}