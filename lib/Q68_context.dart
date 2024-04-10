import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyListView(),
    );
  }
}


class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {

  final itemController = TextEditingController();

  final List<String> items = List.generate(10, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo App"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            trailing: PopupMenuButton<String>(
              onSelected: (value) => handleMenuOption(index, value),
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'edit', child: Text('Edit'),),
                const PopupMenuItem(value: 'view', child: Text('View')),
                const PopupMenuItem(value: 'delete', child: Text('Delete')),
              ],
            ),
          );
        },
      ),
    );
  }

  void handleMenuOption(int index, String value) {
    switch (value) {
      case 'edit':
        _editItem(index);
        break;
      case 'view':
        viewItem(index);
        break;
      case 'delete':
        deleteItem(index);
        break;
      default:
    }
  }

  Future _editItem(int index) {
    final name = items[index];
    itemController.text = name;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Item'),
        content: TextField(
          controller: itemController,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                items[index] = itemController.text;
                itemController.clear();
              });
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  Future viewItem(int index) {
    final name = items[index];
    itemController.text = name;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${name}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }


  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }
}
