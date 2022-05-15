import 'package:flash_chat_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.close)),
        ],
        title: Text("⚡Chat"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Send",
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
