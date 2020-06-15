import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:equatable/equatable.dart';

part 'level_event.dart';
part 'level_state.dart';

class LevelBloc extends Bloc<LevelEvent, LevelState> {
  final _appDataBase = AppDatabase();


  @override
  LevelState get initialState => null;


  @override
  Stream<LevelState> mapEventToState(
    LevelEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
