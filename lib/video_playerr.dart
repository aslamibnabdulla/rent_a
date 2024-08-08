import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_a/riverpod/riverpod_button.dart';
import 'package:video_player/video_player.dart';

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp>
    with AutomaticKeepAliveClientMixin {
  late VideoPlayerController _controller;

  var resumeFrom = 0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://videos.pexels.com/video-files/14854555/14854555-uhd_2560_1440_30fps.mp4'),
    )..initialize().then((_) {
        _controller.setLooping(true);
        _controller.addListener(() {
          setState(() {
            // Rebuild the widget when the video player's state changes.
          });
        });

        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  void playPause() {
    _controller.value.isPlaying ? _controller.pause() : _controller.play();
    setState(() {});
  }

  IconData playPauseWidget() {
    return _controller.value.isPlaying ? Icons.pause : Icons.play_arrow;
  }

  static const List<double> _playbackSpeed = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  formattedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return _controller.value.isInitialized
        ? Center(
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                children: [
                  VideoPlayer(_controller),
                  Container(
                    color: Colors.black45,
                    child: Column(
                      children: [
                        const Spacer(
                          flex: 2,
                        ),
                        Center(
                          child: IconButton(
                            onPressed: () {
                              playPause();
                            },
                            icon: Icon(
                              playPauseWidget(),
                              size: 60,
                            ),
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                playPause();
                              },
                              icon: Icon(
                                playPauseWidget(),
                              ),
                              color: Colors.white,
                            ),
                            IconButton(
                              onPressed: () {
                                _controller.value.volume == 0
                                    ? _controller.setVolume(1)
                                    : _controller.setVolume(0);
                                setState(() {});
                              },
                              icon: Icon(
                                _controller.value.volume == 0
                                    ? Icons.volume_off
                                    : Icons.volume_up,
                              ),
                              color: Colors.white,
                            ),
                            Expanded(
                              child: VideoProgressIndicator(
                                _controller,
                                allowScrubbing: true,
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                "${formattedTime(timeInSecond: _controller.value.position.inSeconds)}/${formattedTime(timeInSecond: _controller.value.duration.inSeconds)}",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            PopupMenuButton(
                                position: PopupMenuPosition.under,
                                icon: const Icon(
                                  Icons.timer,
                                  color: Colors.white,
                                ),
                                onSelected: (double speed) {
                                  _controller.setPlaybackSpeed(speed);
                                },
                                itemBuilder: (BuildContext ctx) {
                                  return <PopupMenuItem<double>>[
                                    for (final double speed in _playbackSpeed)
                                      PopupMenuItem<double>(
                                        value: speed,
                                        child: Text('${speed}x'),
                                      )
                                  ];
                                }),
                            const FullScreenButton(),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        : Container(
            child: const Center(
                child: CircularProgressIndicator(
              strokeWidth: 2,
            )),
          );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}

class FullScreenButton extends ConsumerWidget {
  const FullScreenButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isScreenFull = ref.watch(scrrenProvider);
    return IconButton(
      onPressed: () {
        if (isScreenFull) {
          ref.read(scrrenProvider.notifier).state = false;
        } else {
          ref.read(scrrenProvider.notifier).state = true;
        }
      },
      icon: Icon(
        isScreenFull ? Icons.fullscreen_exit : Icons.fullscreen,
      ),
      color: Colors.white,
    );
  }
}
