import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

void main() {
  runApp(MaterialApp(home: AlertDialogWithButton(),));
}

class AlertDialogWithButton extends StatelessWidget {
  const AlertDialogWithButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
          showDialog(context: context, builder: (context) {
            return AlertDialog(
              title: Text("Alert Dialog Title"),
              content: Text("Alert Dialog Content"),
              actions: [
                ElevatedButton(onPressed: () {
                  showToast("Posotive Button Clicked!",duration: Duration(seconds: 3),context: context);
                  Navigator.pop(context);

                }, child: Text("Positive Button")),
                ElevatedButton(onPressed: () {
                  Navigator.pop(context);
                  showToast("Negative Button Clicked!",duration: Duration(seconds: 3),context: context);
                }, child: Text("Negative Button"))
              ],
            );
          },);
        },child: Text("Click Me"),),
      ),
    );
  }
}
