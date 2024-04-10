import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home : MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final nameController = TextEditingController();
  List<String> namesList = [];

  void addItem() {
    setState(() {
      namesList.add(nameController.text);
      nameController.text = '';
    });
  }

  Future showNameDialog(String name) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Name'),
        content: Text(name),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  Future showContextMenu(int index) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('Delete Item'),
            onTap: () => confirmDelete(index).then( (value) => Navigator.pop(context)),
          ),
          ListTile(
            title: Text('Edit Item'),
            onTap: () => _editItem(index).then((value) => Navigator.pop(context)),
          ),
          ListTile(
            title: Text('Exit'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Future confirmDelete(int index) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Delete'),
        content: Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                namesList.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

  Future _editItem(int index) {
    final name = namesList[index];
    nameController.text = name;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Item'),
        content: TextField(
          controller: nameController,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                namesList[index] = nameController.text;
                nameController.text = '';
              });
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Name List'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Enter Name',
                ),
              ),
              ElevatedButton(
                onPressed: addItem,
                child: Text('Add'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: namesList.length,
                  itemBuilder: (context, index) {
                    final name = namesList[index];
                    return ListTile(
                      title: Text(name),
                      onTap: () => showNameDialog(name),
                      onLongPress: () => showContextMenu(index),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
