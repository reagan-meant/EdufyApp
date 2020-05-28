import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
class Subjects extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get subject_id => integer().autoIncrement()();
  // If the length constraint is not fulfilled, the Task will not
  // be inserted into the database and an exception will be thrown.
  TextColumn get subject_name => text().withLength(min: 1, max: 255)();
  IntColumn get class_id => integer()();
}