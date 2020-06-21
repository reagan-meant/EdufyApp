import 'package:edufy/data/models/Answers.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'AnswerDao.g.dart';

// Denote which tables this DAO can access
@UseDao(tables: [Answers])
class AnswersDao extends DatabaseAccessor<AppDatabase> with _$AnswersDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  AnswersDao(this.db) : super(db);

  Future<List<Answer>> getAllAnswers() => select(answers).get();
  Future<Answer> getAnswersById(int id) {
    return (select(answers)..where((a) => a.answer_id.equals(id))).getSingle();
  }

  Stream<List<Answer>> watchAllAnswers() => select(answers).watch();
  Future insertAnswer(Insertable<Answer> answer) =>
      into(answers).insert(answer);
  Future updateAnswer(Insertable<Answer> answer) =>
      update(answers).replace(answer);
  Future deleteAnswer(Insertable<Answer> answer) =>
      delete(answers).delete(answer);
}
