import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'subject_event.dart';
part 'subject_state.dart';

class SubjectBloc extends Bloc<SubjectEvent, SubjectState> {
  @override
  SubjectState get initialState => SubjectInitial();

  @override
  Stream<SubjectState> mapEventToState(
    SubjectEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
