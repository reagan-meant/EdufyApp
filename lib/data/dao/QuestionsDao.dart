import 'package:edufy/data/models/Questions.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'QuestionsDao.g.dart';

// Denote which tables this DAO can access
@UseDao(tables: [Questions])
class QuestionDao extends DatabaseAccessor<AppDatabase>
    with _$QuestionDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  QuestionDao(this.db) : super(db);

  Future<List<Question>> getAllQuestions() => select(questions).get();
  Stream<List<Question>> watchAllQuestions() => select(questions).watch();
  Stream<List<Question>> watchPaperByClassAndSubject(
      int classId, int subjectId) {
    return (select(questions)
          ..where((p) => p.class_id.equals(classId))
          ..where((p) => p.subject_id.equals(subjectId)))
        .watch();
  }

  Future<List<Question>> watchQuestionByClassSubjectPaper(
      int classId, int subjectId, int paperNumber) {
    return (select(questions)
          ..where((p) => p.class_id.equals(classId))
          ..where((p) => p.subject_id.equals(subjectId))
          ..where((p) => p.paper_number.equals(paperNumber)))
        .get();
  }

  Future insertQuestion(Insertable<Question> question) =>
      into(questions).insert(question);
  Future updateQuestion(Insertable<Question> question) =>
      update(questions).replace(question);
      /* 
  Future updateAnsweredQuestion(Int  answered, int options) =>
      update(questions.answered).replace(answered); */
  Future deleteQuestion(Insertable<Question> question) =>
      delete(questions).delete(question);
}
