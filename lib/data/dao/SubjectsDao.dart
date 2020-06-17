
import 'package:edufy/data/models/Subjects.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'SubjectsDao.g.dart';
// Denote which tables this DAO can access
@UseDao(tables: [Subjects])
class SubjectDao extends DatabaseAccessor<AppDatabase> with _$SubjectDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  SubjectDao(this.db) : super(db);

   Future<List<Subject>> getAllSubjects() => select(subjects).get();
  Stream<List<Subject>> watchAllSubjects() => select(subjects).watch();
  
  Stream<List<Subject>> watchSubjectsByClass(int clas) { 
     return  (select(subjects)..where((p)=>p.class_id.equals(clas))).watch(); 
      }
  
  Future insertSubject(Insertable<Subject> subject) => into(subjects).insert(subject);
Future updateSubject(Insertable<Subject> subject) => update(subjects).replace(subject);
Future deleteSubject(Insertable<Subject> subject) => delete(subjects).delete(subject);


 }


