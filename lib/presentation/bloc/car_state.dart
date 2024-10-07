import 'package:car_rent_app/data/models/cart.dart';

sealed class CarState {}

class CarsLoadingState extends CarState {}

class CarsLoadedState extends CarState {
  final List<Car> cars;

  CarsLoadedState({required this.cars});
}

class CarsError extends CarState {
  final String message;

  CarsError({required this.message});
}
