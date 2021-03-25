import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class audioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Audio"),
      ),
      body: Center(
        child: Container(child: audioButton()),
      ),
    );
  }
}

class audioButton extends StatefulWidget {
  @override
  audioButtonState createState() => audioButtonState();
}

class audioButtonState extends State<audioButton> {
  AudioCache audioCache = AudioCache();
  AudioPlayer player;
  var bytes;
  bool isPlaying = true;

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }

  load() async {
    bytes = await (await audioCache.load('mario.mp3')).readAsBytes();
    player = await audioCache.playBytes(bytes);
    Stream stream = player.onPlayerCompletion;
    stream.listen((dynamic) {
      setState(() {
        isPlaying = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: (isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow)),
      onTap: () {
        setState(() {
          if (isPlaying) {
            player.pause();
            isPlaying = false;
          } else {
            player.resume();
            isPlaying = true;
          }
        });
      },
    );
  }
}
