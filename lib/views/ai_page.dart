import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


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
              Text('جارٍ الإرسال...'),
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
            ResultPage(description: userDescription, response: response),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {},
        ),
        backgroundColor: Color(0xFF7dc297),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'دلني',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(width: 8),
            Image.asset(
              'assets/images/default.png',
              fit: BoxFit.contain,
              height: 32,
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
              ),
            ),
            SizedBox(height: 10),
            Text(
              'أكتب استشارتك وشور بيدلك',
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _textEditingController,
              maxLines: 5,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText:
                    'مثال: كيف يمكنني التخطيط للتقاعد وبناء خطة تقاعد فعّاله',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed:
                  _isButtonEnabled ? () => _submitDescription(context) : null,
              style: ElevatedButton.styleFrom(
                // primary: Color.fromARGB(255, 207, 247, 211),
                // onPrimary: Color.fromARGB(255, 20, 19, 19),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: _isLoading ? CircularProgressIndicator() : Text('ارسال'),
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
