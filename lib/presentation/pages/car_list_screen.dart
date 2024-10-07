import 'package:car_rent_app/presentation/bloc/car_bloc.dart';
import 'package:car_rent_app/presentation/bloc/car_state.dart';
import 'package:car_rent_app/presentation/widget/car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Car'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is CarsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CarsLoadedState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return CarCard(car: state.cars[index]);
              },
              itemCount: state.cars.length,
            );
          } else if (state is CarsError) {
            return Center(
              child: Text('Error while Loading ${state.message}'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
