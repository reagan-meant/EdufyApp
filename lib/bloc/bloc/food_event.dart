part of 'food_bloc.dart';

abstract class FoodEvent extends Equatable {
  const FoodEvent();
}

class GetFoodEvent extends FoodEvent{
  final String _mun;

  
  @override
  // TODO: implement props
  List<Object> get props => null;
  
}