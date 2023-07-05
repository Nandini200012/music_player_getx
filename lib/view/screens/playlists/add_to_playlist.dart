import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xplore_music_app/controller/controller_export.dart';
import 'package:xplore_music_app/view/allfiles_export.dart';



class AddToPlaylists extends StatelessWidget {
  int songIndex;
  AddToPlaylists({super.key, required this.songIndex});

  @override
  Widget build(BuildContext context) {
    final PlaylistController plistController = Get.put(PlaylistController());
    final HomeController homeCntrl = Get.find<HomeController>();
    return TextButton(
      onPressed: (plistController.allDbPlaylists.isEmpty)
          ? () {
              Get.back();
              Get.bottomSheet(
                CreatePlaylist(currentIndex: songIndex),
              );
            }
          : () {
              Get.back();
              Get.bottomSheet(
                DraggableScrollableSheet(
                  initialChildSize: 0.7,
                  maxChildSize: 0.7,
                  minChildSize: 0.1,
                  builder: (context, controller) {
                    return Container(
                      color: const Color.fromARGB(255, 14, 17, 42),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              CreatePlaylist(currentIndex: songIndex),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    plistController.allDbPlaylists.length,
                                physics: const NeverScrollableScrollPhysics(),
                                controller: controller, // set this too
                                itemBuilder: (context, index) =>
                                    BottomSheetListTileWidget(
                                  songIndex: songIndex,
                                  playlistIndex: index,
                                  playlstController: plistController,
                                  hmCntrl: homeCntrl,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
      child: const Text(
        "Add to Playlists",
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
