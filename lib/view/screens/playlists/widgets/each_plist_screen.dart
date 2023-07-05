import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xplore_music_app/view/allfiles_export.dart';

import '../../../../model/database/db_all_models.dart';

class EachPlaylistScreenWidget extends StatelessWidget {
  const EachPlaylistScreenWidget({
    super.key,
    required this.currentPlaylist,
    required this.playlistIndex,
    required this.currentPlaylistSongs,
  });

  final Playlists currentPlaylist;
  final int playlistIndex;
  final List<AllSongs> currentPlaylistSongs;

  @override
  Widget build(BuildContext context) {
    final height1 = MediaQuery.of(context).size.height;
    return Obx(() => Column(
          children: [
            EachPlaylistAppbarWidget(
              playlistName: currentPlaylist.playlistname!,
            ),
            PlaylistFirstSongImageWidget(
              //currentPlaylistSongs: currentPlaylist.playlistssongs!,
              currentPlaylistSongs: currentPlaylistSongs,
            ),
            ListView.builder(
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: currentPlaylistSongs.length+1,
              //itemCount: currentPlaylist.playlistssongs!.length + 1,
              itemBuilder: (context, index) {
                late AllSongs currentSong;
                // if (index != currentPlaylist.playlistssongs!.length) {
                //   currentSong = currentPlaylist.playlistssongs![index];
                // }
                if (index != currentPlaylistSongs.length) {
                  currentSong = currentPlaylistSongs[index];
                }
                return (index == currentPlaylistSongs.length)
                    ? SizedBox(
                        height: height1 * 0.08,
                      )
                    : EachPlaylistListTileWidget(
                        index: index,
                        playlistIndex: playlistIndex,
                        currentSong: currentSong,
                        currentPlaylist: currentPlaylist,
                      );
              },
            ),
          ],
        ));
  }
}
