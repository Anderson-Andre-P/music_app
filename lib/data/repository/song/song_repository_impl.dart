import 'package:dartz/dartz.dart';
import 'package:our_music/data/sources/song/song_firebase_service.dart';
import 'package:our_music/service_locator.dart';

import '../../../domain/repository/song/song.dart';

class SongRepositoryImpl extends SongsRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlayList() async {
    return await sl<SongFirebaseService>().getPlayList();
  }

  @override
  Future<Either> addOrRemoveFromFavoriteSongs(String songId) async {
    return await sl<SongFirebaseService>().addOrRemoveFromFavoriteSongs(songId);
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {
    return await sl<SongFirebaseService>().isFavoriteSong(songId);
  }
}
