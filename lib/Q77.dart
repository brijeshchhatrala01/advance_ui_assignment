import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final _numberController = TextEditingController();

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Enter Mobile Number"
                ),
                controller: _numberController,
              ),
            ),
            const SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () {
                makeCall('+91${_numberController.text}');
              },
              child: const Text('Call Now'),
            ),
            ElevatedButton(
              onPressed: () {
                sendSMS('+91${_numberController.text}', 'Start typing...');
              },
              child: const Text('Send SMS'),
            ),

          ],
        ),
      ),
    ) ;
  }
}
void sendSMS(String phoneNumber, String message) async {
  final url = Uri(scheme: 'sms', path: phoneNumber, queryParameters: {'body': message});
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch SMS composer';
  }
}

void makeCall(String phoneNumber) async {
  final url = Uri(scheme: 'tel', path: phoneNumber);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch call';
  }
}
