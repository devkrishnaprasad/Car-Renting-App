import 'package:car_rent_app/data/data_sources/firebase_car_data_source.dart';
import 'package:car_rent_app/data/models/cart.dart';
import 'package:car_rent_app/domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSource? dataSource;

  CarRepositoryImpl({this.dataSource});
  @override
  Future<List<Car>> fetchCars() {
    return dataSource!.getCars();
  }
}
