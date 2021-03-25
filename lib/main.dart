import 'package:flutter/material.dart';
import 'package:media_app/audio.dart';
import 'package:media_app/video.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Media',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Media"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              child: Card(
                elevation: 10,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => audioScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: ListTile(
                      title: Text("Play Audio"),
                      leading: Icon(Icons.audiotrack),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Card(
                elevation: 10,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => videoScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: ListTile(
                      title: Text("Play Video"),
                      leading: Icon(Icons.video_label),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}