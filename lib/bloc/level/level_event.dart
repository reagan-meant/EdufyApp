part of 'level_bloc.dart';

abstract class LevelEvent extends Equatable {
  const LevelEvent();
}

class loadedLevels extends LevelEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;
  
}