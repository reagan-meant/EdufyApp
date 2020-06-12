import 'package:edufy/data/dao/AnswerDao.dart';
import 'package:edufy/data/dao/LevelsDao.dart';
import 'package:edufy/data/dao/StudentDao.dart';
import 'package:edufy/data/dao/ClassesDao.dart';
import 'package:edufy/data/dao/MarksDao.dart';
import 'package:edufy/data/dao/QuestionsDao.dart';
import 'package:edufy/data/dao/SubjectsDao.dart';
import 'package:edufy/data/dao/TermsDao.dart';

import 'package:edufy/data/models/Answers.dart';
import 'package:edufy/data/models/Classes.dart';
import 'package:edufy/data/models/Levels.dart';
import 'package:edufy/data/models/Marks.dart';
import 'package:edufy/data/models/Questions.dart';
import 'package:edufy/data/models/Students.dart';
import 'package:edufy/data/models/Subjects.dart';
import 'package:edufy/data/models/Terms.dart';
import 'package:flutter/services.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

// Moor works by source gen. This file will all the generated code.
part 'moor_db.g.dart';

// This annotation tells the code generator which tables this DB works with
@UseMoor(tables: [
  Questions,
  Answers,
  Students,
  Classes,
  Marks,
  Subjects,
  Terms,
  Levels
], daos: [
  StudentDao,
  ClassesDao,
  MarksDao,
  SubjectDao,
  MarksDao,
  QuestionDao,
  AnswersDao,
  TermsDao,
  LevelsDao
])
//StudentDao,ClassesDao,MarksDao,SubjectsDao,MarksDao,QuestionsDao,AnswersDao
// _$AppDatabase is the name of the generated class
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'masowe.sqlite',
          singleInstance: true,
          creator: (file) async {
            final content = await rootBundle.load('masowe.sqlite');
            await file.writeAsBytes(content.buffer.asUint8List());
          },
          // Good for debugging - prints SQL in the console
          logStatements: true,
        )));

  // Bump this when changing tables and columns.
  // Migrations will be covered in the next part.
  @override
  int get schemaVersion => 1;
}
