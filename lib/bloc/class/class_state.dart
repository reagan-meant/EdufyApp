part of 'class_bloc.dart';

abstract class ClassState extends Equatable {
  const ClassState();
}

class ClassInitial extends ClassState {
  @override
  List<Object> get props => [];
}
