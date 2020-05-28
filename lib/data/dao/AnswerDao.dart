
import 'package:edufy/data/models/Answers.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
// Denote which tables this DAO can access
@UseDao(tables: [Answers])
class AnswerDao extends DatabaseAccessor<AppDatabase> with _$AnswerDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  AnswerDao(this.db) : super(db);

  Future<List<Answer>> getAllAnswers() => select(answer).get();
  Stream<List<Answer>> watchAllAnswers() => select(answer).watch();
  Future insertAnswer(Insertable<Answer> answer) => into(answers).insert(answer);
Future updateAnswer(Insertable<Answer> answer) => update(answers).replace(answer);
Future deleteAnswer(Insertable<Answer> answer) => delete(answers).delete(answer);
}