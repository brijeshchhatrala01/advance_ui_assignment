import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

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
  _showDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Grant phone call permission'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancle'),
            ),
            ElevatedButton(
              onPressed: () {
                Permission.phone.request();
                Navigator.pop(context);
              },
              child: const Text('Allow'),
            )
          ],
        );
      },
    );
  }

  //show dialog if user doesn't allow phone permission
  void isShowDialog() async {
    if (await Permission.phone.status.isDenied) {
      _showDialog();
    }
  }

  @override
  void initState() {
    isShowDialog();
    getPhonePermissionStatus();

    super.initState();
  }

  String permissionStatus = "";

   getPhonePermissionStatus() async {
    var isPermissionGiven = await await Permission.phone.status.isGranted;
    setState(()  {
      //print permisson if granted
      permissionStatus = isPermissionGiven
        ? 'Permission Granted!!!'
        : 'Not Given';
    
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone app'),
      ),
      body: Center(
        child: Text(permissionStatus),
      ),
    );
  }
}
