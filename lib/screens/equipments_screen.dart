import 'package:flutter/material.dart';
import 'package:rent_a/widgets/equipments/equipments_grid.dart';

class EquipmentsScreen extends StatelessWidget {
  const EquipmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Equipments'),
          ),
          EquipmentsGrid(),
        ],
      ),
    );
  }
}
