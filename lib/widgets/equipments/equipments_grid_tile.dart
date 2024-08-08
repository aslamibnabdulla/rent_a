import 'package:flutter/material.dart';

class EquipmentsGridTile extends StatelessWidget {
  const EquipmentsGridTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
                child: Icon(
              Icons.image_not_supported,
            )),
            Text(
              '\$ 400',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '2 bedroom',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 15,
                ),
                Text('Kozhikode'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
