import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
   Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _firstNumberController = TextEditingController();

  final _secondNumberController = TextEditingController();

  bool isEmptyText = false;

   _sum() {
     return int.parse(_firstNumberController.text.toString()) + int.parse(_secondNumberController.text.toString());
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _firstNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorText: isEmptyText ? "Enter Number" : null,
                  border: UnderlineInputBorder(),
                  hintText: "Enter First Number"
                ),
              ),
              const SizedBox(height: 18,),
              TextField(
                controller: _secondNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    errorText: isEmptyText ? "Enter Number" : null,
                    border: UnderlineInputBorder(),
                    hintText: "Enter First Number"
                ),
              ),
              const SizedBox(height: 18,),
              ElevatedButton(onPressed: () {
                if(_firstNumberController.text.isEmpty && _secondNumberController.text.isEmpty){
                  setState(() {
                    isEmptyText = !isEmptyText;
                  });
                }
                else {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(sum: _sum()),));
                }
              }, child: Text("Click"))
            ],
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final int sum;
  const SecondScreen({super.key,required this.sum});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Sum : ${sum}"),
      ),
    );
  }
}
