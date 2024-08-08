import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText(
    this.icon,
    this.textt, {
    super.key,
  });

  final String textt;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Row(
        children: [
          Icon(icon),
          Expanded(
            child: Text(
              textt,
            ),
          ),
        ],
      ),
    );
  }
}
