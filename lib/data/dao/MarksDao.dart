
import 'package:edufy/data/models/Marks.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
// Denote which tables this DAO can access
@UseDao(tables: [Marks])
class MarkDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  MarkDao(this.db) : super(db);

  Future<List<Mark>> getAllTasks() => select(marks).get();
  Stream<List<Mark>> watchAllTasks() => select(marks).watch();
  Future insertTask(Insertable<Mark> mark) => into(marks).insert(mark);
Future updateTask(Insertable<Mark> mark) => update(marks).replace(mark);
Future deleteTask(Insertable<Mark> mark) => delete(marks).delete(mark);
}