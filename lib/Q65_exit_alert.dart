import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(home: MyaApp(),));
}

class MyaApp extends StatelessWidget {
  const MyaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("A P P B A R"),
        actions: [
          IconButton(onPressed: () {
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                title: Text("Are you sure to logout!"),
                actions: [
                  ElevatedButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: Text("No")),
                  ElevatedButton(onPressed: () {
                    SystemNavigator.pop();
                  }, child: Text("Yes"))
                ],
              );
            },);
          }, icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
