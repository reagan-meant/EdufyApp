import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
// The name of the database table is "tasks"
// By default, the name of the generated data class will be "Task" (without "s")
// The name of the database table is "tasks"
// By default, the name of the generated data class will be "Task" (without "s")
class Questions extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get question_id => integer().autoIncrement()();
  // If the length constraint is not fulfilled, the Task will not
  // be inserted into the database and an exception will be thrown.
  TextColumn get question_text => text().withLength(min: 1, max: 255)();
  IntColumn get class_id => integer()();
  IntColumn get term_id => integer()();
  IntColumn get correct_option => integer()();
  IntColumn get answer_id => integer()();
  IntColumn get subject_id => integer()();
  IntColumn get answered => integer()();
  IntColumn get times_correct => integer()();
  IntColumn get times_wrong => integer()();
  // DateTime is not natively supported by SQLite
  // Moor converts it to & from UNIX seconds
  //DateTimeColumn get dueDate => dateTime().nullable()();
  // Booleans are not supported as well, Moor converts them to integers
  // Simple default values are specified as Constants
  // BoolColumn get completed => boolean().withDefault(Constant(false))();
}