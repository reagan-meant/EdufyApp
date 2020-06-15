part of 'questions_bloc.dart';

abstract class QuestionsState extends Equatable {
  const QuestionsState();
}

class QuestionsInitial extends QuestionsState {
  @override
  List<Object> get props => [];
}
