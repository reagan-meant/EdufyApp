
import 'package:edufy/data/models/Terms.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'TermsDao.g.dart';
// Denote which tables this DAO can access
@UseDao(tables: [Terms])
class TermsDao extends DatabaseAccessor<AppDatabase> with _$TermsDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  TermsDao(this.db) : super(db);

   Future<List<Term>> getAllTerms() => select(terms).get();
  Stream<List<Term>> watchAllTerms() => select(terms).watch();
  Future insertTask(Insertable<Term> term) => into(terms).insert(term);
Future updateTask(Insertable<Term> term) => update(terms).replace(term);
Future deleteTask(Insertable<Term> term) => delete(terms).delete(term); 
}