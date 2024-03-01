import 'dart:ui';

import 'package:Shoar/constants/colors.dart';
import 'package:flutter/material.dart';

import 'components/Avatar.dart';
import 'chat_page.dart';

class ChatHomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ChatHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorGreen,
      body: SafeArea(
        child: Column(
          children: [
            _top(),
            _body(),
          ],
        ),
      ),
    );
  }

  Widget _top() {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black12,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'بحث',
                            hintStyle:
                                TextStyle(color: Colors.white.withOpacity(0.8)),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(color: Colors.white),
                          maxLines: 1,
                          minLines: 1,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      SizedBox(
                          width:
                              10), // Add some spacing between text field and icon
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          color: Colors.white,
        ),
        child: ListView(
          padding: EdgeInsets.only(top: 15),
          physics: BouncingScrollPhysics(),
          children: [
            _itemChats(
              avatar: 'lib/assets/images/default.png',
              name: 'جوني دو',
              chat: 'نص بديل هو ببساطة النص الشكلي لصناعة الطباعة والتنسيق',
              time: '08.10',
            ),
            _itemChats(
              avatar: 'lib/assets/images/default.png',
              name: 'أدريان',
              chat: 'ماعدا الطعن عن نقطة برويدنت',
              time: '03.19',
            ),
            _itemChats(
              avatar: 'lib/assets/images/default.png',
              name: 'فيونا',
              chat: 'مرحبا 😎',
              time: '02.53',
            ),
            _itemChats(
              avatar: 'lib/assets/images/default.png',
              name: 'إيما',
              chat: 'تصميمات نصية متقدمة متعددة الباقين',
              time: '11.39',
            ),
            _itemChats(
              avatar: 'lib/assets/images/default.png',
              name: 'ألكسندر',
              chat: 'استثناء ليس بوتيكات أو بنجمة أو نص خالية من الرسم البياني',
              time: '00.09',
            ),
            _itemChats(
              avatar: 'lib/assets/images/default.png',
              name: 'ألسوهر',
              chat: 'استثناء ليس بوتيكات أو بنجمة أو نص خالية من الرسم البياني',
              time: '00.09',
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
    String time = '00.00',
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
                padding: EdgeInsets.only(left: 10, top: 25),
                child: Text(
                  '$time',
                  style: TextStyle(color: Colors.grey, fontFamily: 'Tajawal'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 25),
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
                            fontWeight: FontWeight.bold,
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
                  size: 85,
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
