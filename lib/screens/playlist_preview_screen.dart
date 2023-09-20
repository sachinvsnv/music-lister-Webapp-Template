import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaylistPreviewScreen extends StatelessWidget {
  final String musicLink;

  PlaylistPreviewScreen({required this.musicLink});

  void _launchSong() async {
    if (await canLaunch(musicLink)) {
      await launch(musicLink);
    } else {
      print('Could not launch $musicLink');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playlist Preview'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Song details
            ElevatedButton(
              onPressed: _launchSong,
              child: Text('Play Song'),
            ),
          ],
        ),
      ),
    );
  }
}
