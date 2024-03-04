import 'dart:io';
import 'dart:ui';
import 'package:intl/intl.dart' as ui;

import 'package:Shoar/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'widgets/avatar.dart';

class ChatPage extends StatefulWidget {
  @override
  Received createState() => Received();
}

const bool useEmulator = true;

class Received extends State<ChatPage> {
  String host = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  FirebaseFirestore db = FirebaseFirestore.instance;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  _topChat(),
                  _bodyChat(),
                  SizedBox(
                    height: 120,
                  )
                ],
              ),
              _formChat(),
            ],
          ),
        ),
      ),
    );
  }

  _topChat() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black12,
                ),
                child: Icon(
                  Icons.call,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black12,
                ),
                child: Icon(
                  Icons.videocam,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'رضا العيدروس',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _bodyChat() {
    return Expanded(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('timestamp', descending: false)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          return Container(
              padding: EdgeInsets.only(left: 25, right: 25, top: 25),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45)),
                color: Colors.white,
              ),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  return _itemChat(
                    avatar:
                        'assets/images/reda.png', // Update with actual avatar
                    chat: data['uid'], // Update with actual chat direction
                    message: data['text'],
                    time: data['timestamp'].toString(),
                  );
                }).toList(),
              ));
        },
      ),
    );
  }

  // 0 = Send
  // 1 = Received
  Widget _itemChat({
  required String avatar,
  required int chat,
  required String message,
  required String time, // Keep this as Timestamp
}) {
String timeFormatted = ui.DateFormat('kk:mm').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              int.parse(time)));

  return Row(
    mainAxisAlignment: chat == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      chat == 1
          ? Avatar(
              image: avatar,
              size: 40,
            )
          : SizedBox(),
      Flexible(
        child: Container(
          margin: EdgeInsets.only(
            left: chat == 0 ? 10 : 0,
            right: chat == 1 ? 10 : 0,
            top: 20,
          ),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: chat == 0
                ? primaryColorTurquoise.withOpacity(0.1)
                : primaryColorYellow.withOpacity(0.1),
            borderRadius: chat == 0
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  )
                : BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
          ),
          child: Column(
            crossAxisAlignment: chat == 0 ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text('$message', textAlign: TextAlign.right),
              SizedBox(height: 5),
              Text(
                '$timeFormatted',
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

  Widget _formChat() {
    String messageText = ''; // Variable to store the text input
    TextEditingController _messageController = TextEditingController();

    void sendMessage() async {
      String message = _messageController.text.trim();
      if (message.isNotEmpty) {
        if (useEmulator) {
          db.useFirestoreEmulator(host, 8080);
          db.settings = const Settings(
            persistenceEnabled: false,
          );
        }
        // Insert messageText into Firebase collection
        FirebaseFirestore.instance.collection('chat').add({
          'text': messageText,
          'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
          'uid': 1
        }).then((value) {
          // Clear the text field after sending message
          setState(() {
            messageText = '';
          });
        }).catchError((error) {
          // Handle errors if any
          print("Failed to send message: $error");
        });
        _messageController.clear();
      }
    }

    return Positioned(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 120,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _messageController,
                  textAlign: TextAlign.right,
                  onChanged: (value) {
                    // Update messageText when text changes
                    messageText = value;
                  },
                  decoration: InputDecoration(
                    hintText: '...اكتب رسالتك',
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    labelStyle: TextStyle(fontSize: 12),
                    contentPadding: EdgeInsets.all(20),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color.fromRGBO(236, 239, 241, 1)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color.fromRGBO(236, 239, 241, 1)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              SizedBox(
                  width: 10), // Add some spacing between text field and button
              IconButton(
                  icon: Icon(Icons.send), onPressed: () => sendMessage()),
            ],
          ),
        ),
      ),
    );
  }
}
