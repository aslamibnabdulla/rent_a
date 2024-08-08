import 'package:flutter/material.dart';
import 'package:rent_a/screens/car/car_detail_screen.dart';
import 'package:rent_a/widgets/cars/icon_text.dart';

class ShortInfo extends StatelessWidget {
  const ShortInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 60),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                IconText(Icons.local_gas_station, 'Petrol'),
                IconText(Icons.settings, 'Automatic'),
              ],
            ),
          ),
          Spacer(),
          Expanded(
            child: Column(
              children: [
                IconText(Icons.speed, '23000 km'),
                IconText(Icons.chair, '4'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
