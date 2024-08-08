import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_a/constants.dart';
import 'package:rent_a/model/car_model.dart';
import 'package:rent_a/riverpod/riverpod_button.dart';
import 'package:rent_a/screens/car/image_full_screen.dart';
import 'package:rent_a/video_playerr.dart';

class CarImageWidget extends ConsumerWidget {
  CarImageWidget(
    this._car, {
    super.key,
  });
  final CarModel _car;

  late final _carImages = [
    FittedBox(
      fit: BoxFit.cover,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          _car.image,
        ),
      ),
    ),
    FittedBox(
      fit: BoxFit.cover,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(ImageUrl.imageUrl1),
      ),
    ),
    FittedBox(
      fit: BoxFit.cover,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          ImageUrl.imageUrl2,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isPictureSelected = ref.watch(testProvider);
    return isPictureSelected
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: OpenContainer(
              transitionType: ContainerTransitionType.fadeThrough,
              transitionDuration: const Duration(milliseconds: 1000),
              closedElevation: 0,
              closedBuilder: (BuildContext context, openContainer) {
                return SizedBox(
                  height: 200,
                  child: PageView(
                    children: _carImages.map((e) => e).toList(),
                  ),
                );
              },
              openBuilder: (BuildContext context, closedContainer) {
                return ImageFullScreen(_car.image);
              },
            ),
          )
        : const SizedBox(height: 200, child: VideoApp());
  }
}
