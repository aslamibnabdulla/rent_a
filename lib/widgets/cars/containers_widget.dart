import 'package:flutter/material.dart';

class ContainersWidget extends StatelessWidget {
  const ContainersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              decoration: const BoxDecoration(
                color: Color(0xff90A4AE),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Text(
                      'Manufacturing year : ',
                    ),
                  ),
                  Text('2019'),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              decoration: const BoxDecoration(
                color: Color(0xff90A4AE),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Text('Vehicle  type :'),
                  ),
                  Text('sportscar'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
