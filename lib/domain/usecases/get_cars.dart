import 'package:car_rent_app/data/models/cart.dart';
import 'package:car_rent_app/domain/repositories/car_repository.dart';

class GetCars {
  final CarRepository repository;

  GetCars({required this.repository});

  Future<List<Car>> call() async {
    return await repository.fetchCars();
  }
}
