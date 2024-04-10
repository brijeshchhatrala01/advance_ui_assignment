import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:  MyApp(),));
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  TextEditingController date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextField(
          controller: date,
          readOnly: true,
          decoration: InputDecoration(
            hintText: "Click to select date",
            prefixIcon: IconButton(onPressed: () {
              showDatePicker(context: context, firstDate: DateTime(2023), lastDate: DateTime(2025)).then((value) {
                date.text = value.toString();
              });
            }, icon: Icon(Icons.calendar_month))
          ),
        ),
      ),
    );
  }
}
