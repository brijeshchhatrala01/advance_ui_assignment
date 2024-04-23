import 'package:advance_ui_assignment/Q61_advance_ui/homepage.dart';
import 'package:advance_ui_assignment/Q61_advance_ui/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow)),
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
