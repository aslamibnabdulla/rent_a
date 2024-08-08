import 'package:flutter/material.dart';
import 'package:rent_a/screens/video_call_screen.dart';
import 'package:rent_a/colors/colors.dart';
import 'package:rent_a/screens/chat_screen.dart';
import 'package:rent_a/video_playerr.dart';

class CallChatRow extends StatelessWidget {
  const CallChatRow({
    super.key,
  });

  final buttonStyle = const ButtonStyle(
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
    ),
    backgroundColor: WidgetStatePropertyAll(
      Color(0xff90A4AE),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextButton.icon(
              style: buttonStyle,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.call,
                color: Colors.red,
              ),
              label: const Text(
                'Chat with us',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            child: TextButton.icon(
              style: buttonStyle,
              onPressed: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  constraints: const BoxConstraints(maxHeight: 230),
                  useSafeArea: true,
                  showDragHandle: true,
                  isDismissible: true,
                  backgroundColor: Theme.of(context).cardColor,
                  context: context,
                  builder: (context) => BottomSheet(buttonStyle: buttonStyle),
                );
              },
              icon: const Icon(
                Icons.phone,
                color: Colors.green,
              ),
              label: const Text(
                'call us',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomSheet extends StatelessWidget {
  const BottomSheet({
    super.key,
    required this.buttonStyle,
  });

  final ButtonStyle buttonStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ListTile(
            tileColor: Colours.scaffColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            leading: const Icon(Icons.phone_enabled),
            title: const Text('Voice Call'),
          ),
          const SizedBox(height: 5),
          ListTile(
            tileColor: Colours.scaffColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            leading: const Icon(Icons.phone),
            title: const Text('Phone Call'),
          ),
          const SizedBox(height: 5),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VideoCallScreen()));
            },
            tileColor: Colours.scaffColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            leading: const Icon(Icons.videocam),
            title: const Text('Video Call'),
          ),
        ],
      ),
    );
  }
}
