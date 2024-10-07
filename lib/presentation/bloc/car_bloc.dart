import 'package:bloc/bloc.dart';
import 'package:car_rent_app/domain/usecases/get_cars.dart';
import 'package:car_rent_app/presentation/bloc/car_event.dart';
import 'package:car_rent_app/presentation/bloc/car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars getCars;

  CarBloc({required this.getCars}) : super(CarsLoadingState()) {
    on<LoadCars>((event, emit) async {
      emit(CarsLoadingState());
      try {
        final cars = await getCars.call();
        emit(CarsLoadedState(cars: cars));
      } catch (e) {
        emit(CarsError(message: e.toString()));
      }
    });
  }
}
