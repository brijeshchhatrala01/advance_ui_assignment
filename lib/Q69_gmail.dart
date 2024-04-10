import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail Clone',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gmail'),
        ),
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text('F'),
              ),
              title: Text(
                'LottieFiles',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Organize and find your Lottie...",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Organize and find your Lottie...",
                  )
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('8 Apr'), Icon(Icons.star_border)],
              ),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.mail),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.videocam),
              label: 'Meet',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        drawer: Drawer(
            child: ListView(children: [
          UserAccountsDrawerHeader(
            accountName: Text("brijesh kansara"),
            accountEmail: Text("b@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: Text(
                "B",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.label_important),
            title: Text("Primary"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Social"),
          ),
          ListTile(
            leading: Icon(Icons.error),
            title: Text("Updates"),
            trailing: Text(
              " 2 new ",
              style: TextStyle(backgroundColor: Colors.orange, fontSize: 14),
            ),
          ),
        ])));
  }
}
