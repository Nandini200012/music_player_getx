import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xplore_music_app/controller/controller_export.dart';
import 'package:xplore_music_app/view/allfiles_export.dart';
import '../../../../controller/playlist_controller.dart';
import '../../../../model/database/db_all_models.dart';


class PlaylistListTileWidget extends StatelessWidget {
  const PlaylistListTileWidget({
    super.key,
    required this.index,
    required this.currentPlaylist,
    required this.tileController,
  });
  final int index;
  final Playlists currentPlaylist;
  final PlaylistController tileController;

  @override
  Widget build(BuildContext context) {
    final widthDsp = MediaQuery.of(context).size.height;
    return Obx(() => ListTile(
          onTap: () {
            tileController.currentPlaylistSongs.value = tileController.allDbPlaylists[index].playlistssongs!;
            tileController.convertPlaylistSongs(index);
            Get.to(
              () => EachPlaylistSongs(
                currentPlaylist: currentPlaylist,
                playlistIndex: index,
                currentPlaylistSongs: tileController.currentPlaylistSongs.value,
              ),
            );
          },
          leading:
              (tileController.allDbPlaylists[index].playlistssongs!.isEmpty)
                  ? Container(
                      width: widthDsp * 0.065,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/music_icon.jpg')),
                      ),
                    )
                  : ListTileLeadingWidget(
                      currentSong: tileController
                          .allDbPlaylists[index].playlistssongs!.first),
          title: Text(
            currentPlaylist.playlistname!,
            style: const TextStyle(
                fontSize: 20, fontFamily: 'Poppins', color: Colors.white),
          ),
          subtitle: Text(
            (currentPlaylist.playlistssongs!.length <= 1)
                ? '${currentPlaylist.playlistssongs!.length.toString()} Song'
                : '${currentPlaylist.playlistssongs!.length.toString()} Songs',
            style: const TextStyle(
                fontSize: 16, fontFamily: 'Poppins', color: Colors.white),
          ),
          trailing: PopupMenuButton<String>(
            color: Colors.white.withOpacity(0.7),
            padding: const EdgeInsets.all(0.0),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: "Delete",
                child: PlaylistDeleteButtonWidget(
                  index: index,
                  currentPlaylist: currentPlaylist,
                  btnController: tileController,
                ),
              ),
              PopupMenuItem<String>(
                value: "Rename",
                child: PlaylistRenameButtonWidget(
                  index: index,
                  currentPlaylist: currentPlaylist,
                  btnController: tileController,
                ),
              ),
            ],
          ),
        ));
  }
}
