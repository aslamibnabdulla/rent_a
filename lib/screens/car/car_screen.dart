import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a/constants.dart';

import 'package:rent_a/widgets/cars/car_list_tile.dart';
import 'package:rent_a/model/car_model.dart';
import 'package:rent_a/widgets/services/auth.dart';

class CarScreen extends StatelessWidget {
  CarScreen({
    super.key,
  });
  var imageUrl =
      'https://cdn.pixabay.com/photo/2015/01/27/09/58/man-613601_1280.jpg';

  final _carList = CarList();

  late final List _cars = _carList.car.map((e) => CarModel.fromMap(e)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Car'),
            actions: [
              TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: const Text("Confirm Logout"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Provider.of<Auth>(context, listen: false)
                                      .clearToken();
                                  Navigator.pop(context);
                                },
                                child: const Text("Log Out"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("cancel"),
                              )
                            ],
                          ));
                },
                child: const Text("Log Out"),
              )
            ],
            floating: true,
          ),
          SliverList(
            // Car List
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return CarListTile(_cars[index]);
              },
              childCount: _cars.length,
            ),
          )
        ],
      ),
    );
  }
}
