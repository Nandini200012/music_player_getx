import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xplore_music_app/controller/controller_export.dart';
import 'package:xplore_music_app/view/allfiles_export.dart';
import '../../../controller/playlist_controller.dart';
import '../../../model/database/db_all_models.dart';

class EachPlaylistSongs extends StatelessWidget {
  final Playlists currentPlaylist;
  final int playlistIndex;
  final List<AllSongs> currentPlaylistSongs;
  const EachPlaylistSongs({
    super.key,
    required this.currentPlaylist,
    required this.playlistIndex,
    required this.currentPlaylistSongs,
  });

  @override
  Widget build(BuildContext context) {
    final PlaylistController plstController = Get.put(PlaylistController());
    return Scaffold(
      body: Obx(
        () => (plstController
                .allDbPlaylists[playlistIndex].playlistssongs!.isEmpty)
            ? EachPlaylistEmptyScreen(
                playlistName: currentPlaylist.playlistname!,
              )
            : SingleChildScrollView(
                child: EachPlaylistScreenWidget(
                  currentPlaylist: currentPlaylist,
                  playlistIndex: playlistIndex,
                  currentPlaylistSongs: plstController.currentPlaylistSongs,
                ),
              ),
      ),
    );
  }
}
