import 'package:Shoar/models/category.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '/constants/colors.dart';
import 'ai_assistante_page.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({Key? key}) : super(key: key);

  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  TextEditingController _textEditingController = TextEditingController();
  bool _isButtonEnabled = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        _isButtonEnabled = _textEditingController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _submitDescription(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    String userDescription = _textEditingController.text;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
Text(
  'لحظات وسنقوم بتوجيهك لقائمة الخبراء الأنسب لك',
  textAlign: TextAlign.right,
  style: TextStyle(
    // Your existing style properties
  ),
),
            ],
          ),
        );
      },
    );

    String response = await chatGPTAPI(userDescription);

    setState(() {
      _isLoading = false;
    });

    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AiAssistanteResults(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'تحتاج لمساعدة في تحديد المستشار الأنسب لك ؟',
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                                  fontFamily: 'Tajawal',

              ),
            ),
            SizedBox(height: 10),
            Text(
              'أكتب استشارتك وشور بيدلك',
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 18,
                                  fontFamily: 'Tajawal',

                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _textEditingController,
              maxLines: 3,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintStyle: TextStyle(
      fontFamily: 'Tajawal', 
      fontSize: 16,
    ),
                hintText:
                    'مثال: كيف يمكنني التخطيط للتقاعد وبناء خطة تقاعد فعّاله',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white), // Set border color to white
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed:
                  _isButtonEnabled ? () => _submitDescription(context) : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColorTurquoise.withOpacity(0.50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: _isLoading
                  ? CircularProgressIndicator()
                  
                  : Text(
                      'أرشدني',
                      style: TextStyle(
                        color: Color.fromARGB(
                            255, 246, 243, 243), // Set text color
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> messages = [];
const String OpenAiKey = 'sk-Y4GtljaCS8IHR8Q000000000000000flWT3BlbkFJp';

Future<String> chatGPTAPI(String prompt) async {
  messages.add({
    'role': 'user',
    'content': prompt,
  });
  try {
    final res = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $OpenAiKey',
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": messages,
      }),
    );
    print(res.statusCode);
    if (res.statusCode == 200) {
      String content = jsonDecode(res.body)['choices'][0]['message']['content'];
      content = content.trim();

      messages.add({
        'role': 'assistant',
        'content': content,
      });
      return content;
    }
    return 'An internal error occurred';
  } catch (e) {
    return e.toString();
  }
}

class ResultPage extends StatelessWidget {
  final String description;
  final String response;

  ResultPage({required this.description, required this.response});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Entered Description: $description',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Response from chatGPTAPI: $response',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
