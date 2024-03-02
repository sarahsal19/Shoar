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
      backgroundColor:
          Colors.transparent, // Set Scaffold background color to transparent

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/background.png"), // Replace "assets/background_image.jpg" with your image path
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
              avatar: 'assets/images/reda.png',
              chat: 0,
              message: 'السلام عليكم ورحمة الله, مساك الله بالخير أ.رضا ',
              time: '18.00',
            ),
            _itemChat(
              chat: 0,
              message:
                  'عندي استفسار بخصوص الاستثمار في المنصات التقنية , هل تنصح فيه ؟ عندي سيولة مالية الحمدلله لكن محتار هل بتنمو مع الاستثمار أو لا؟',
              time: '18.03',
            ),
            _itemChat(
              avatar: 'assets/images/reda.png',
              chat: 1,
              message:
                  ' وعليكم السلام ورحمة الله وبركاته, اهلا بك ومساك الله بالنور ',
              time: '18.45',
            ),
            _itemChat(
              avatar: 'assets/images/reda.png',
              chat: 1,
              message:
                  'انصحك بدراسة وتحليل المخاطر قبل اتخاذ القرار الاستثماري ‏اغلبية شركات التقنية الناشئة تتصف بمخاطرعالية جداً وتتفاوت درجات المخاطر في نوعها (تقنية، تشريعية، قانونية،تشغيلية،مالية ،تشغيلية، السوق، السيولة،…) وحجمها ومداها من شركة إلى أخرى ‏وعليه فانه من المفترض ان تقوم بتحليل تلك المخاطر لمعرفة مدى درجة المخاطرة الممكن تحملها أو تحييدها ومدى تأثيرها على مستقبل الشركة والعوائد المتوقعة على الاستثمار',
              time: '18.47',
            ),
            _itemChat(
              chat: 0,
              message: 'هل فيه فرصة استثمارية تنصح فيها؟ نثق برأيكم أ.رضا😎',
              time: '18.53',
            ),
            _itemChat(
              avatar: 'assets/images/reda.png',
              chat: 1,
              message:
                  'عندك هذي الفرصة الاستثمارية في قطاع التقنية ‏(استثمار جريء) ‏النمو المتوقع ضعفين خلال اقل من  سنتين "فنون" مختصة بالتصوير واللوحات الفنية وعرض الاعمال الفنية  ',
              time: '19.00',
            ),
            _itemChat(
              avatar: 'assets/images/reda.png',
              chat: 1,
              message: 'الحد الأدنى للاستثمار ‏70,000 ريال',
              time: '19.01',
            ),
            _itemChat(
              chat: 0,
              message: 'ممتاز ممتاز , الله يعطيك العافية ما قصرت',
              time: '19.02',
            ),
            _itemChat(
              avatar: 'assets/images/reda.png',
              chat: 1,
              message: 'الله يعافيك بالتوفيق',
              time: '19.05',
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
      mainAxisAlignment:
          chat == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
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
              crossAxisAlignment:
                  chat == 0 ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text('$message'),
                ),
                SizedBox(height: 5),
                Text(
                  '$time',
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 12), //todo: small size
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
                borderSide:
                    BorderSide(color: const Color.fromRGBO(236, 239, 241, 1)),
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: const Color.fromRGBO(236, 239, 241, 1)),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
