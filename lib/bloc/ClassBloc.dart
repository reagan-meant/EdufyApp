import 'package:edufy/data/moor_db.dart';
import 'package:edufy/events/class/set_class_event.dart';
import 'package:edufy/events/edufy_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassBloc extends Bloc<edufyEvent, List<Classe>> {
  @override
  get initialState => List<Classe>();

  @override
  Stream<List<Classe>> mapEventToState(edufyEvent event) async* {
    if (event is setClass) {
      yield event.classList;
    } /* else if (event is addSubject) {
      List<Subject> newState = List.from(state);
      if (event.newSubject != null) {
        newState.add(event.newSubject);
      }
      yield newState;
    } */
  }
}
