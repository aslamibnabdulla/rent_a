import 'package:flutter/material.dart';
import 'package:rent_a/chats_list.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Chat> _chats = chats.map<Chat>((e) => Chat.fromMap(e)).toList();

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: _chats
                      .map(
                        (e) => ChatMessage(e),
                      )
                      .toList()),
            ),
          ),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  _chats.add(
                    Chat(
                      message: _controller.text,
                      isSenderU: true,
                    ),
                  );
                  _controller.clear();
                  setState(() {});
                },
                icon: const Icon(Icons.send),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: 'Type your message',
            ),
          )
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  const ChatMessage(
    this._chat, {
    super.key,
  });
  final Chat _chat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: _chat.isSenderU ? 5 : 60,
        right: _chat.isSenderU ? 60.0 : 5,
        top: 5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _chat.isSenderU
              ? const CircleAvatar(
                  radius: 15,
                  child: FittedBox(child: Text('YOU')),
                )
              : Container(),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: _chat.isSenderU
                    ? Theme.of(context).secondaryHeaderColor
                    : Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(_chat.isSenderU ? 0 : 8),
                  bottomRight: Radius.circular(_chat.isSenderU ? 8 : 0),
                  topLeft: const Radius.circular(8),
                  topRight: const Radius.circular(8),
                ),
              ),
              child: Text(_chat.message),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          _chat.isSenderU
              ? Container()
              : const CircleAvatar(
                  radius: 15,
                  child: FittedBox(child: Text('You')),
                )
        ],
      ),
    );
  }
}
