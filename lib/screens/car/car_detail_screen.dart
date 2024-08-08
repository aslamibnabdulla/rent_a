import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_a/colors/colors.dart';
import 'package:rent_a/model/car_model.dart';
import 'package:rent_a/riverpod/riverpod_button.dart';
import 'package:rent_a/video_playerr.dart';
import 'package:rent_a/widgets/cars/call_chat_widget.dart';
import 'package:rent_a/widgets/cars/car_image_widget.dart';
import 'package:rent_a/widgets/cars/containers_widget.dart';
import 'package:rent_a/widgets/cars/short_info_widgets.dart';

enum Choice { pictures, video }

class CarDetailScreen extends ConsumerWidget {
  const CarDetailScreen(this._car, {super.key});
  final CarModel _car;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isPictureSelected = ref.watch(testProvider);
    bool isFullScreenSelected = ref.watch(scrrenProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_car.title),
        ),
        backgroundColor: Theme.of(context).cardColor,
        body: isFullScreenSelected
            ? const RotatedBox(quarterTurns: 1, child: VideoApp())
            : Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 63,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            NeumorphicButton(
                              shadowColor: isPictureSelected
                                  ? Colors.white
                                  : Colors.grey[600]!,
                              color: isPictureSelected
                                  ? const Color(0xffd7d7d7)
                                  : const Color(0xffe0e0e0),
                              onPressed: () {
                                ref.read(testProvider.notifier).state = true;

                                print(isPictureSelected);
                              },
                              child: const Text('Pictures'),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            NeumorphicButton(
                              shadowColor: isPictureSelected
                                  ? Colors.grey[600]!
                                  : Colors.white,
                              color: isPictureSelected
                                  ? const Color(0xffe0e0e0)
                                  : const Color(0xffd7d7d7),
                              onPressed: () {
                                ref.read(testProvider.notifier).state = false;
                                print(isPictureSelected);
                              },
                              child: const Text('Video'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CarImageWidget(_car),
                        const SizedBox(
                          height: 10,
                        ),
                        // const Text('1/${}'),
                        const SizedBox(height: 20),
                        const ShortInfo(),
                        const SizedBox(height: 15),
                        const ContainersWidget(),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Description',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                              'The Mazda MX-5 is a lightweight two-person sports car manufactured and marketed by Mazda with a front mid-engine, rear-wheel-drive layout. The convertible is marketed as the Mazda Roadster (マツダ・ロードスター, Matsuda Rōdosutā) or Eunos Roadster (ユーノス・ロードスター, Yūnosu Rōdosutā) in Japan, and as the Mazda Miata (/miˈɑːtə/) in the United States, and formerly in Canada, where it is now marketed as the MX-5 but is still commonly referred to as Miata.'),
                        ),
                        const SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: CallChatRow(),
                  ),
                ],
              ),
      ),
    );
  }
}

class Car {
  static const String carImage =
      "https://th.bing.com/th/id/OIP.CfUpf6mtnUFURCnAdnVMMgHaEK?pid=ImgDet&rs=1";
}

class NeumorphicButton extends ConsumerWidget {
  final VoidCallback onPressed;
  final Widget child;

  final Color color;
  final Color shadowColor;

  const NeumorphicButton(
      {super.key,
      required this.shadowColor,
      required this.color,
      required this.onPressed,
      required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isPictureSelected = ref.watch(testProvider);
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(5, 5),
            blurRadius: 10,
            color: shadowColor,
          ),
          BoxShadow(
            offset: const Offset(-5, -5),
            blurRadius: 10,
            color: Colors.grey[200]!,
          ),
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: GestureDetector(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
