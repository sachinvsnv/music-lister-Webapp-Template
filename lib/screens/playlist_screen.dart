// lib/screens/playlist_screen.dart
import 'package:my_flutter_app/models/playlist.dart';
import 'package:flutter/material.dart';

class PlaylistScreen extends StatefulWidget {
  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  List<Playlist> playlists = [];

  TextEditingController playlistNameController = TextEditingController();
  TextEditingController songNameController = TextEditingController();
  TextEditingController artistController = TextEditingController();
  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playlists'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: playlistNameController,
              decoration: InputDecoration(labelText: 'Playlist Name'),
            ),
            TextField(
              controller: songNameController,
              decoration: InputDecoration(labelText: 'Song Name'),
            ),
            TextField(
              controller: artistController,
              decoration: InputDecoration(labelText: 'Artist'),
            ),
            TextField(
              controller: urlController,
              decoration: InputDecoration(labelText: 'URL'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Create a new playlist and add it to the list
                  Playlist newPlaylist = Playlist(
                    name: playlistNameController.text,
                    songs: [
                      SongDetails(
                        songName: songNameController.text,
                        artist: artistController.text,
                        url: urlController.text,
                      ),
                    ],
                  );
                  playlists.add(newPlaylist);

                  // Clear the input fields
                  playlistNameController.clear();
                  songNameController.clear();
                  artistController.clear();
                  urlController.clear();
                });
              },
              child: Text('Create Playlist'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: playlists.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3.0,
                    child: ListTile(
                      title: Text(playlists[index].name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: playlists[index]
                            .songs
                            .map(
                              (song) =>
                                  Text('${song.songName} - ${song.artist}'),
                            )
                            .toList(),
                      ),
                      onTap: () {
                        // Navigate to the playlist preview screen with songs
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
