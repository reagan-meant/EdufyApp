part of 'subject_bloc.dart';

abstract class SubjectState extends Equatable {
  const SubjectState();
}

class SubjectInitial extends SubjectState {
  @override
  List<Object> get props => [];
}
