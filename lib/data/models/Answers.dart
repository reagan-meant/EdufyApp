import 'package:equatable/equatable.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
class Answers extends Table{
  // autoIncrement automatically sets this to be the primary key
  IntColumn get answer_id => integer().autoIncrement()();
  // If the length constraint is not fulfilled, the Task will not
  // be inserted into the database and an exception will be thrown.
  TextColumn get option1 => text().withLength(min: 1, max: 255)();
  TextColumn get option2 => text().withLength(min: 1, max: 255)();
  TextColumn get option3 => text().withLength(min: 1, max: 255)();
  TextColumn get option4 => text().withLength(min: 1, max: 255)();
}