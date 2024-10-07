import 'package:car_rent_app/data/data_sources/firebase_car_data_source.dart';
import 'package:car_rent_app/data/repositories/car_repository_impl.dart';
import 'package:car_rent_app/domain/repositories/car_repository.dart';
import 'package:car_rent_app/domain/usecases/get_cars.dart';
import 'package:car_rent_app/presentation/bloc/car_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initInjection() {
  try {
    getIt.registerLazySingleton(() => FirebaseFirestore.instance);
    getIt.registerLazySingleton<FirebaseCarDataSource>(
        () => FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>()));

    getIt.registerLazySingleton<CarRepository>(
        () => CarRepositoryImpl(dataSource: getIt<FirebaseCarDataSource>()));

    getIt.registerLazySingleton<GetCars>(
        () => GetCars(repository: getIt<CarRepository>()));

    getIt.registerFactory(() => CarBloc(getCars: getIt<GetCars>()));
  } catch (e) {
    rethrow;
  }
}
