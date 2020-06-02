
import 'package:edufy/data/models/Classes.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'ClassesDao.g.dart';
// Denote which tables this DAO can access
@UseDao(tables: [Classes])
class ClassesDao extends DatabaseAccessor<AppDatabase> with _$ClassesDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  ClassesDao(this.db) : super(db);

   Future<List<Classe>> getAllClasses() => select(classes).get();
  Stream<List<Classe>> watchAllClasses() => select(classes).watch();
  Future insertTask(Insertable<Classe> classe) => into(classes).insert(classe);
Future updateTask(Insertable<Classe> classe) => update(classes).replace(classe);
Future deleteTask(Insertable<Classe> classe) => delete(classes).delete(classe); 
}