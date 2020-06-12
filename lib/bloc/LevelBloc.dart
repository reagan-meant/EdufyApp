import 'package:edufy/data/moor_db.dart';
import 'package:edufy/events/edufy_event.dart';
import 'package:edufy/events/level/set_level_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LevelBloc extends Bloc<edufyEvent, List<Level>> {
  @override
  get initialState => List<Level>();

  @override
  Stream<List<Level>> mapEventToState(edufyEvent event) async* {
    if (event is setLevels) {
      yield event.levelList;
    } /* else if (event is addSubject) {
      List<Subject> newState = List.from(state);
      if (event.newSubject != null) {
        newState.add(event.newSubject);
      }
      yield newState;
    } */
  }
}
