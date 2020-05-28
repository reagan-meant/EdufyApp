import 'package:edufy/data/dao/StudentDao.dart';
import 'package:edufy/data/dao/ClassesDao.dart';
import 'package:edufy/data/dao/MarksDao.dart';
import 'package:edufy/data/dao/QuestionsDao.dart';
import 'package:edufy/data/dao/AnswersDao.dart';

import 'package:edufy/data/models/Answers.dart';
import 'package:edufy/data/models/Classes.dart';
import 'package:edufy/data/models/Marks.dart';
import 'package:edufy/data/models/Questions.dart';
import 'package:edufy/data/models/Students.dart';
import 'package:edufy/data/models/Subjects.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

// Moor works by source gen. This file will all the generated code.
part 'moor_db.g.dart';

// This annotation tells the code generator which tables this DB works with
@UseMoor(tables: [Questions, Answers,Students,Classes,Marks,Subjects],daos: [])
//StudentDao,ClassesDao,MarksDao,SubjectsDao,MarksDao,QuestionsDao,AnswersDao
// _$AppDatabase is the name of the generated class
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          // Good for debugging - prints SQL in the console
          logStatements: true,
        )));

  // Bump this when changing tables and columns.
  // Migrations will be covered in the next part.
  @override
  int get schemaVersion => 1;

  /*
  // All tables have getters in the generated class - we can select the tasks table
  Future<List<Subject>> getAllSubject() => select(subjects).get();

  // Moor supports Streams which emit elements when the watched data changes
  Stream<List<Subject>> watchAllSubject() => select(subjects).watch();

  Future insertTask(Subject task) => into(subjects).insert(task);

  // Updates a Task with a matching primary key
  Future updateTask(Subject task) => update(subjects).replace(task);

  Future deleteTask(Subject task) => delete(subjects).delete(task);
*/
}