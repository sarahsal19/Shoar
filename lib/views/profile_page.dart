import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '/constants/colors.dart';
import 'chat_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0, // Remove the shadow
        // Set background color of the app bar
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              // Implement your back button functionality here
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_forward_ios,
              size: 25,
              color: Colors.white,
            ),
          ),
        ],
        flexibleSpace: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                "assets/images/background.png", // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
            // Rest of the app bar content
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                elevation: 0,
              ),
            ),
          ],
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
              ),
            ),
            SizedBox(width: 30),
            Text(
              'مستشار مالي', // Arabic Name
              style: TextStyle(
                fontSize: 14,
                color: primaryColorBlue,
              ),
            ),
            SizedBox(height: 10),
            // Description
            Text(
              'مستشار مالي مرخص بالسعودية (ترخيص 579046) خبرة مصرفية ومالية تتجاوز ال 25 عاماً، ماجستير علوم مالية',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),

            // Skills
            Text(
              ':التخصصات الدقيقة', // Skills Title
              style: TextStyle(
                fontSize: 20,
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
              'التقيمات', // Reviews Title
              style: TextStyle(
                fontSize: 20,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ChatPage()), // Navigate to ChatPage
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: primaryColorTurquoise.withOpacity(0.50), ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'بدء المحادثة',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 243, 241, 241),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 8,
        selectedIconTheme: IconThemeData(color: primaryColorBlue, size: 30),
        selectedItemColor: primaryColorBlue,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'حسابي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'المحادثات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الصفحة الرئيسية',
          ),
        ],
        currentIndex: 0, // Change this index according to the current page
        onTap: (int index) {
          // Handle navigation here...
        },
      ),
    );
  }

  // Custom method to build skill box widget
  Widget buildSkillBox(String title) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(
            255, 244, 235, 235), // Set background color to dark gray
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          title,
          style: TextStyle(
            color: primaryColorTurquoise, // Set text color to green
          ),
        ),
      ),
    );
  }

  // Custom method to build review item
  Widget buildReviewItem(
      String imagePath, String date, double rating, String review, int count) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color.fromARGB(255, 244, 239, 239)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(backgroundImage: AssetImage(imagePath)),
              SizedBox(width: 10),
              //Text(date),
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
      ),
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
