import 'package:flutter/material.dart';
import 'package:rent_a/constants.dart';

class ImageFullScreen extends StatelessWidget {
  const ImageFullScreen(this._carImage, {super.key});

  final String _carImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView(children: [
          Image.network(_carImage),
          Image.network(ImageUrl.imageUrl2),
          Image.network(ImageUrl.imageUrl3),
        ]),
      ),
    );
  }
}
