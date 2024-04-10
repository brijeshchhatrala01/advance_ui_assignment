import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Drawer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    GalleryPage(),
    AudioPage(),
    VideoPage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Media Explorer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Gallery'),
              leading: Icon(Icons.image),
              onTap: () => onItemTapped(0),
            ),
            ListTile(
              title: Text('Audio'),
              leading: Icon(Icons.audiotrack),
              onTap: () => onItemTapped(1),
            ),
            ListTile(
              title: Text('Video'),
              leading: Icon(Icons.videocam),
              onTap: () => onItemTapped(2),
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex], // Display current page based on index
    );
  }
}

// Individual Page Widgets with Dummy Data (Replace with your design)
class GalleryPage extends StatelessWidget {
  final List<String> imageUrls = [
    'Images/carnival.png',
    'Images/carnival.png',
    'Images/carnival.png',
    'Images/carnival.png',
    'Images/carnival.png',
    'Images/carnival.png',
    'Images/carnival.png',
    'Images/carnival.png',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 3,
        children: List.generate(
            100,
            (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12)),
                      child: Image.asset('Images/carnival.png',
                          width: 100, height: 90)),
                )));
  }
}

class AudioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const CircleAvatar(
                  child: Icon(Icons.music_note),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  children: [
                    Text("Audio $index"),
                  ],
                ),
                Spacer(),
                Text('4 : 43'),
                Icon(Icons.more_vert),
              ],
            ),
          ),
        );
      },
    );
  }
}

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset('assets/images/res_logo.png'),
          title: Text("Video $index"),
          subtitle: Text("Duration : 2:30:00"),
          trailing: Icon(Icons.more_vert),
        );
      },
    );
  }
}
