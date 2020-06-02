
import 'package:edufy/data/models/Marks.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'MarksDao.g.dart';
// Denote which tables this DAO can access
@UseDao(tables: [Marks])
class MarksDao extends DatabaseAccessor<AppDatabase> with _$MarksDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  MarksDao(this.db) : super(db);

  Future<List<Mark>> getAllMarks() => select(marks).get();
  Stream<List<Mark>> watchAllMarks() => select(marks).watch();
  Future insertMarks(Insertable<Mark> mark) => into(marks).insert(mark);
Future updateMarks(Insertable<Mark> mark) => update(marks).replace(mark);
Future deleteMarks(Insertable<Mark> mark) => delete(marks).delete(mark);
}