import 'package:edufy/data/moor_db.dart';
import 'package:edufy/events/edufy_event.dart';
import 'package:edufy/events/term/set_term_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermBloc extends Bloc<edufyEvent, List<Term>> {
  @override
  get initialState => List<Term>();

  @override
  Stream<List<Term>> mapEventToState(edufyEvent event) async* {
    if (event is setTerms) {
      yield event.termList;
    } /* else if (event is addSubject) {
      List<Subject> newState = List.from(state);
      if (event.newSubject != null) {
        newState.add(event.newSubject);
      }
      yield newState;
    } */
  }
}
