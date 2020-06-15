import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'questions_event.dart';
part 'questions_state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  @override
  QuestionsState get initialState => QuestionsInitial();

  @override
  Stream<QuestionsState> mapEventToState(
    QuestionsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
