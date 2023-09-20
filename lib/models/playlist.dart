// lib/models/playlist.dart

class Playlist {
  String name;
  List<SongDetails> songs;

  Playlist({required this.name, required this.songs});
}

class SongDetails {
  String songName;
  String artist;
  String url;

  SongDetails(
      {required this.songName, required this.artist, required this.url});
}
