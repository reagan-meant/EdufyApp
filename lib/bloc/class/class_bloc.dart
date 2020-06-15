import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'class_event.dart';
part 'class_state.dart';

class ClassBloc extends Bloc<ClassEvent, ClassState> {
  @override
  ClassState get initialState => ClassInitial();

  @override
  Stream<ClassState> mapEventToState(
    ClassEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
