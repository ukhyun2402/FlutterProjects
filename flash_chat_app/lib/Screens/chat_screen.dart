import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flash_chat_app/constants.dart';
import 'package:flutter/material.dart';

final _ref = FirebaseDatabase.instance.ref('messages');
final FirebaseAuth _auth = FirebaseAuth.instance;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  static String id = "chat";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();

  User? loggedInUser;
  String message = "";

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  // GET USER INFORMATION AND SAVE
  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              },
              icon: Icon(Icons.close)),
        ],
        title: Text("⚡Chat"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      messageTextController.clear();
                      await _ref.push().set({
                        'sender': _auth.currentUser!.email,
                        'text': message,
                        'timestamp': DateTime.now().millisecondsSinceEpoch,
                      });
                    },
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

class MessageStream extends StatelessWidget {
  const MessageStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // stream: _ref.onValue,
      stream: FirebaseDatabase.instance
          .ref('messages')
          // .startAt(0)
          .onValue,
      builder: (context, snapshot) {
        List<MessageBubble> messageBubble = [];

        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        print((snapshot.data as DatabaseEvent).snapshot.value);

        if ((snapshot.data as DatabaseEvent).snapshot.value == null) {
          return Material();
        }

        final messages = Map<String, dynamic>.from(
            (snapshot.data as DatabaseEvent).snapshot.value as Map);

        messages.forEach((key, value) {
          final message = (value as Map);
          final messageSender = message['sender'];
          final messageText = message['text'];
          final currentUser = _auth.currentUser!.email;

          messageBubble.add(MessageBubble(
            text: messageText,
            sender: messageSender,
            isMe: currentUser == messageSender,
          ));
        });

        return Expanded(
          child: ListView(
            reverse: true,
            children: messageBubble,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key? key,
    required this.text,
    required this.sender,
    required this.isMe,
  }) : super(key: key);

  final String text;
  final String sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: isMe
                ? kBubbleRadius.copyWith(topLeft: Radius.circular(30))
                : kBubbleRadius.copyWith(topRight: Radius.circular(30)),
            elevation: 5,
            color: isMe ? Colors.lightBlue : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Text(
                "$text",
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
