import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../constants/api_constants.dart';
import '../models/consultant.dart';
import 'profile_page.dart';

class ConsultantsScreen extends StatefulWidget {
  const ConsultantsScreen({Key? key}) : super(key: key);

  @override
  _ConsultantsScreenState createState() => _ConsultantsScreenState();
}

class _ConsultantsScreenState extends State<ConsultantsScreen> {
  List<Consultant> consultants = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.consultantsPath}/${ApiConstants.pathVariable}'),
              headers: {
        'Content-Type': 'application/json',
        'X-API-Key': ApiConstants.apiKey,
      },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Consultant> fetchedConsultants =
            data.map((consultantData) => Consultant.fromJson(consultantData)).toList();

        setState(() {
          consultants = fetchedConsultants;
        });
      } else {
        // Handle error
        print('Failed to fetch consultants: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error fetching consultants: $e');
    }
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
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    separatorBuilder: (_, __) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    shrinkWrap: true,
                    itemBuilder: (_, int index) {
                      return CourseContainer(
                        consultant: consultants[index],
                      );
                    },
                    itemCount: consultants.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseContainer extends StatelessWidget {
  final Consultant consultant;

  const CourseContainer({
    Key? key,
    required this.consultant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    consultant.name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontFamily: 'Tajawal',
                        ),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    consultant.position,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontFamily: 'Tajawal',
                        ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                consultant.thumbnail,
                height: 60,
                alignment: Alignment.topRight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
