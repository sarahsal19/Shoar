import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {},
        ),
        backgroundColor:
            Color(0xFF7dc297), // Set background color of the app bar
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'نبذه عني', // Title in Arabic
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Tajawal" 
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(
                  'assets/images/reda.png'), // Add your image path here
            ),
            SizedBox(height: 20),
            // Name
            Text(
              'رضا العيدروس', // Arabic Name
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                              fontFamily: "Tajawal" 

              ),
            ),
            SizedBox(height: 10),
            // Description
            Text(
              'مستشار مالي مرخص بالسعودية (ترخيص 579046) خبرة مصرفية ومالية تتجاوز ال 25 عاماً، ماجستير علوم مالية',
              textAlign: TextAlign.right,
              style: TextStyle(
                              fontFamily: "Tajawal" 
,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            // Experiences Section
            Text(
              'الخبرات:', // Experiences Section Title
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                              fontFamily: "Tajawal" 

              ),
              textDirection: TextDirection.rtl,
            ),
            // List of experiences
            buildExperienceItem('مستشار مالي', '2018 - الآن'),
            buildExperienceItem('محلل مالي', '2015 - 2018'),
            buildExperienceItem('محاسب', '2014 - 2015'),
            SizedBox(height: 20),
            // Skills
            Text(
              ':التخصصات الدقيقة', // Skills Title
              style: TextStyle(
                fontSize: 20,
                              fontFamily: "Tajawal" 
,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Skills Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buildSkillBox('المالية'),
                SizedBox(width: 20),
                buildSkillBox('المحاسبة'),
              ],
            ),
            SizedBox(height: 20),
            // Evaluation
            Text(
              ':المراجعات', // Reviews Title
              style: TextStyle(
                fontSize: 20,
                              fontFamily: "Tajawal" 
,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Star Rating and Reviews
            buildReviewItem(
                'assets/images/default.png',
                '01 Nov,2023',
                4,
                'كانت الجلسة التي أجريناها للاستشارة ممتازة بكل المقاييس. لقد أثبت المستشار كفاءته واحترافيته في فهم احتياجاتي المالية وتقديم النصائح المناسبة',
                4),
            buildReviewItem(
                'assets/images/default.png',
                '22 Nov,2023',
                4,
                'قد أظهر المستشار مهارات عالية في فهم احتياجاتي المالية وتقديم النصائح المناسبة بشكل  عام لكن .للأسف، وجدت بعض الصعوبات فيما يتعلق بالاستجابة السريعة لبعض الاستفسارات الإضافية التي طرحتها',
                3),
            SizedBox(height: 20),
            // Connect Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ChatPage()), // Navigate to ChatPage
                  // );
                },
                style: ElevatedButton.styleFrom(
                  // primary: Color.fromARGB(255, 207, 247, 211),
                  // onPrimary: Color.fromARGB(255, 20, 19, 19),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'ارسال طلب استشارة',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontFamily: "Tajawal",
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Custom method to build experience list item
  Widget buildExperienceItem(String title, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: ListTile(
            title: Text(
              title,
              textDirection: TextDirection.rtl,
            ),
            subtitle: Text(
              subtitle,
              textDirection: TextDirection.rtl,
            ),
            trailing: Icon(Icons.work, color: Colors.green),
          ),
        ),
      ],
    );
  }

  // Custom method to build skill box widget
  Widget buildSkillBox(String title) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 207, 247, 211),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color.fromARGB(255, 248, 246, 246),
          width: 2,
        ),
      ),
      child: SkillBox(title),
    );
  }

  // Custom method to build review item
  Widget buildReviewItem(
      String imagePath, String date, double rating, String review, int count) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleAvatar(backgroundImage: AssetImage(imagePath)),
            SizedBox(width: 10),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(date, style: TextStyle(fontSize: 10)),
                  SizedBox(width: 20),
                  RatingBar(
                    initialRating: rating,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: count,
                    ratingWidget: RatingWidget(
                      empty: Icon(Icons.star_border, color: Colors.amber),
                      full: Icon(Icons.star, color: Colors.amber),
                      half: Icon(Icons.star_half, color: Colors.amber),
                    ),
                    itemSize: 20.0,
                    itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(width: 10, height: 30),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          review,
          textAlign: TextAlign.right,
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

// Custom widget for skill boxes
class SkillBox extends StatelessWidget {
  final String title;

  SkillBox(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 195, 235, 185)),
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: EdgeInsets.all(8.0),
      child: Text(
        title,
        textAlign: TextAlign.right,
      ),
    );
  }
}
