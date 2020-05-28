import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
class Students extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get student_id => integer().autoIncrement()();
  // If the length constraint is not fulfilled, the Task will not
  // be inserted into the database and an exception will be thrown.
  TextColumn get student_fname => text().withLength(min: 1, max: 255)();
  TextColumn get student_lname => text().withLength(min: 1, max: 255)();
  TextColumn get student_mname => text().withLength(min: 1, max: 255)();
  TextColumn get student_email => text().withLength(min: 1, max: 255)();
  TextColumn get student_username => text().withLength(min: 1, max: 255)();
  TextColumn get student_password => text().withLength(min: 1, max: 255)();
  IntColumn get class_id => integer()();
}