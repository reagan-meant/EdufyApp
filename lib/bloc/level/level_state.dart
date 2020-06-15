part of 'level_bloc.dart';

abstract class LevelState extends Equatable {
  const LevelState();
    @override
  List<Object> get props => [];

}

class LevelInitial extends LevelState {
  @override
  List<Object> get props => [];
}

class returnedLevels extends LevelState{
  List<Level> levels;

returnedLevels(this.levels);
  @override
  List<Object> get props => [levels];
}
