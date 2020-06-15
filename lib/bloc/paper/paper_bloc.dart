import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'paper_event.dart';
part 'paper_state.dart';

class PaperBloc extends Bloc<PaperEvent, PaperState> {
  @override
  PaperState get initialState => PaperInitial();

  @override
  Stream<PaperState> mapEventToState(
    PaperEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
