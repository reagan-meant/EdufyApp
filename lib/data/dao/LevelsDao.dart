
import 'package:edufy/data/models/Levels.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'LevelsDao.g.dart';
// Denote which tables this DAO can access
@UseDao(tables: [Levels])
class LevelsDao extends DatabaseAccessor<AppDatabase> with _$LevelsDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  LevelsDao(this.db) : super(db);

   Future<List<Level>> getAllLevels() => select(levels).get();
  Stream<List<Level>> watchAllLevels() => select(levels).watch();
  Future insertTask(Insertable<Level> level) => into(levels).insert(level);
Future updateTask(Insertable<Level> level) => update(levels).replace(level);
Future deleteTask(Insertable<Level> level) => delete(levels).delete(level); 
}