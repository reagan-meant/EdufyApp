import 'package:edufy/data/moor_db.dart';
import 'package:edufy/events/edufy_event.dart';

class setSubjects extends edufyEvent {
  List<Subject> subjectList;

  setSubjects(List<Subject> subjects) {
    subjectList.addAll(subjects);
  }
}
