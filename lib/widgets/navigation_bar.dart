import 'package:flutter/material.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget(
      {super.key, required this.currentPageIndex, required this.updateUI});

  final int currentPageIndex;
  final Function(int) updateUI;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        updateUI(index);
      },
      indicatorColor: Colors.grey,
      selectedIndex: currentPageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.car_repair_sharp),
          icon: Icon(Icons.car_repair_sharp),
          label: 'Car',
        ),
        NavigationDestination(
          icon: Badge(child: Icon(Icons.handyman_sharp)),
          label: 'Tools',
        ),
        NavigationDestination(
          icon: Badge(
            label: Text('2'),
            child: Icon(Icons.apartment_outlined),
          ),
          label: 'Apartments',
        ),
      ],
    );
  }
}
