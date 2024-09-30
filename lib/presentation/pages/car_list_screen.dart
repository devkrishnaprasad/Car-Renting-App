import 'package:car_rent_app/data/models/cart.dart';
import 'package:car_rent_app/presentation/widget/car_card.dart';
import 'package:flutter/material.dart';

class CarListScreen extends StatelessWidget {
  CarListScreen({super.key});
  final List<Car> cars = [
    Car(
        model: 'Fortuner GR',
        distance: 870,
        fuelCapacity: 50,
        pricePerHour: 45),
    Car(
        model: 'Fortuner GR',
        distance: 870,
        fuelCapacity: 50,
        pricePerHour: 45),
    Car(
        model: 'Fortuner GR',
        distance: 870,
        fuelCapacity: 50,
        pricePerHour: 45),
    Car(model: 'Fortuner GR', distance: 870, fuelCapacity: 50, pricePerHour: 45)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Car'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CarCard(car: cars[index]);
        },
        itemCount: cars.length,
      ),
    );
  }
}
