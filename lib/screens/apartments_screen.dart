import 'package:flutter/material.dart';
import 'package:rent_a/widgets/apartments/apartments_grid.dart';

class ApartmentsScreen extends StatelessWidget {
  const ApartmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Apartments'),
          ),
          ApartmentsGrid(),
        ],
      ),
    );
  }
}
