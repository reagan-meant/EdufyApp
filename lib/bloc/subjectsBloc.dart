import 'package:edufy/data/moor_db.dart';
import 'package:edufy/events/edufy_event.dart';
import 'package:edufy/events/subject/add_subject_event.dart';
import 'package:edufy/events/subject/set_subject_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectBloc extends Bloc<edufyEvent, List<Subject>> {
  @override
  get initialState => List<Subject>();

  @override
  Stream<List<Subject>> mapEventToState(edufyEvent event) async* {
    if (event is setSubjects) {
      yield event.subjectList;
    } else if (event is addSubject) {
      List<Subject> newState = List.from(state);
      if (event.newSubject != null) {
        newState.add(event.newSubject);
      }
      yield newState;
    }
  }
}
