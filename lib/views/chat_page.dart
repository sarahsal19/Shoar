import 'dart:ui';

import 'package:Shoar/constants/colors.dart';
import 'package:flutter/material.dart';
import 'widgets/avatar.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorGreen,
      body: SafeArea(
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
                'عبد العزيز',
                style: TextStyle(
                    fontSize: 28,
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
    child: Container(
      padding: EdgeInsets.only(left: 25, right: 25, top: 25),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45), topRight: Radius.circular(45)),
        color: Colors.white,
      ),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          _itemChat(
            avatar: 'assets/images/default.png', 
            chat: 1,
            message:
                'النص العربي هو نص دمج وطباعة الصناعة.',
            time: '18.00',
          ),
          _itemChat(
            chat: 0,
            message: 'حسنا 🐣',
            time: '18.00',
          ),
          _itemChat(
            avatar: 'assets/images/default.png', 
            chat: 1,
            message: 'لقد نجا ليس فقط خمسة قرون، 😀',
            time: '18.00',
          ),
          _itemChat(
            chat: 0,
            message:
                'على عكس الاعتقاد السائد، فإن لوريم إيبسوم ليس مجرد نص عشوائي. 😎',
            time: '18.00',
          ),
          _itemChat(
            avatar: 'assets/images/default.png', 
            chat: 1,
            message:
                'النص الذي تم إنشاؤه بواسطة لوريم إيبسوم لا يحتوي على أي تكرار، ولا تحتوي على تكرار للكلمات الفكاهية المدمجة أو غير الخاصة بالشخصية.',
            time: '18.00',
          ),
          _itemChat(
            avatar: 'assets/images/default.png', 
            chat: 1,
            message: '😅 😂 🤣',
            time: '18.00',
          ),
        ],
      ),
    ),
  );
}


  // 0 = Send
  // 1 = Recieved
  Widget _itemChat({int? chat, String? avatar, message, time}) {
  return Row(
    mainAxisAlignment: chat == 0
        ? MainAxisAlignment.end
        : MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      chat == 1
          ? Avatar(
              image: avatar,
              size: 50,
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
            crossAxisAlignment: chat == 0
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text('$message'),
              ),
              SizedBox(height: 5),
              Text(
                '$time',
                style: TextStyle(color: Colors.grey.shade400),//todo: small size
              ),
            ],
          ),
        ),
      ),
    ],
  );
}


Widget _formChat() {
  return Positioned(
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 120,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        color: Colors.white,
        child: TextField(
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: '...اكتب رسالتك',
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.image_rounded),
                  color: primaryColorTurquoise,
                  onPressed: () {
                    // Add image button action here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.mic_rounded),
                  color: primaryColorTurquoise,
                  onPressed: () {
                    // Add voice button action here
                  },
                ),
              ],
            ),
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: TextStyle(fontSize: 12),
            contentPadding: EdgeInsets.all(20),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: const Color.fromRGBO(236, 239, 241, 1)),
              borderRadius: BorderRadius.circular(25),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: const Color.fromRGBO(236, 239, 241, 1)),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    ),
  );
}

}
