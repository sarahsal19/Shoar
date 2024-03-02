import 'dart:ui';

import 'package:flutter/material.dart';

import 'widgets/avatar.dart';
import 'chat_page.dart';
import 'widgets/custom_header.dart';

class ChatHomePage extends StatefulWidget {
  const ChatHomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ChatHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeaderContainer(
          title: "",
        ),
        _body(),
      ],
    );
  }

  Widget _body() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.only(
          // topLeft: Radius.circular(45), topRight: Radius.circular(5)),
          color: Colors.white,
        ),
        child: ListView(
          padding: EdgeInsets.only(top: 15),
          physics: BouncingScrollPhysics(),
          children: [
            _itemChats(
              avatar: 'assets/images/reda.png',
              name: 'رضا العيدروس',
              chat: 'الله يعافيك بالتوفيق ',
              time: '08:10',
            ),
            _itemChats(
              avatar: 'assets/images/default.png',
              name: 'عبدالعزيز الشهري',
              chat: 'ولا عليك أمر تفيدني بخصوص اللي سألتك عنه أمس',
              time: '03:19',
            ),
            _itemChats(
              avatar: 'assets/images/default.png',
              name: 'سالم الصقير',
              chat: 'مرحبا 😊',
              time: '02:53',
            ),
            _itemChats(
              avatar: 'assets/images/default.png',
              name: 'نايف الحمد',
              chat: 'ممتاز الله يعطيك العافية',
              time: '11:39',
            ),
            _itemChats(
              avatar: 'assets/images/default.png',
              name: 'أحمد اباالخيل',
              chat: 'بكرة نتناقش فيها',
              time: '11:10',
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemChats({
    String avatar = '',
    String name = '',
    String chat = '',
    String time = '00:00',
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChatPage(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade300,
              width: 0.5,
            ),
          ),
        ),
        child: Card(
          // margin: EdgeInsets.symmetric(vertical: 10),
          elevation: 0,
          color: Colors.white,
          child: Row(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align items to the start
            children: [
              // Time
              Padding(
                padding: EdgeInsets.only(left: 10, top: 28),
                child: Text(
                  '$time',
                  style: TextStyle(color: Colors.grey, fontFamily: 'Tajawal'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Name
                      Text(
                        '$name',
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      // Chat message
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          '$chat',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Avatar
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Avatar(
                  size: 65,
                  image: avatar,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
