import 'package:flutter/material.dart';
import '/constants/colors.dart';

void main() {
  runApp(RatingPage());
}

class RatingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
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
              Positioned.fill(
                child: Image.asset(
                  "assets/images/background.png",
                  fit: BoxFit.cover,
                ),
              ),
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
        body: UserEvaluationForm(),
      ),
    );
  }
}

class UserEvaluationForm extends StatefulWidget {
  @override
  _UserEvaluationFormState createState() => _UserEvaluationFormState();
}

class _UserEvaluationFormState extends State<UserEvaluationForm> {
  int _rating = 0;
  String _comment = '';

  void _setRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  void _submitEvaluation(BuildContext context) {
    // Perform submission logic here, like sending data to a server
    print('Rating: $_rating');
    print('Comment: $_comment');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/rating.png',
                width: 230, // Adjust the width as needed
                height: 170,
              ), // Add your image here
              //Text('Title'), // Add your title text here
            ],
          ),
          content: Text(
            'تم أرسال تقييمك , شكرا لك ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Tajawal',
            ),
          ),
        );
      },
    );

    // Reset form after submission
    setState(() {
      _rating = 0;
      _comment = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'تقييم الجلسة',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(),
              ),
              Expanded(
                flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int i = 1; i <= 5; i++)
                      IconButton(
                        icon: Icon(
                          _rating >= i ? Icons.star : Icons.star_border,
                          color: Colors.orange,
                        ),
                        onPressed: () => _setRating(i),
                      ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          TextField(
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: 'أكتب تعليقك هنا عن الجلسه (اختياري)',
              border: OutlineInputBorder(),
            ),
            maxLines: 4,
            onChanged: (value) {
              setState(() {
                _comment = value;
              });
            },
          ),
          SizedBox(height: 20.0),
          Center(
            child: ElevatedButton(
              onPressed: () => _submitEvaluation(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColorTurquoise.withOpacity(0.50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'إرسال التقييم',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 246, 243, 243), // Set text color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
