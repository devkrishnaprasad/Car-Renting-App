import 'package:car_rent_app/data/models/cart.dart';

abstract class CarRepository {
  Future<List<Car>> fetchCars();
}
