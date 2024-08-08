import 'package:flutter/material.dart';
import 'package:rent_a/widgets/apartments/apartments_grid_tile.dart';

class ApartmentsGrid extends StatelessWidget {
  const ApartmentsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.9,
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: 30,
          (BuildContext context, int index) {
            return const ApartmentGridTile();
          },
        ),
      ),
    );
  }
}
