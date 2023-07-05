import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xplore_music_app/controller/controller_export.dart';
import 'package:xplore_music_app/view/allfiles_export.dart';

class ScreenAllSongs extends StatelessWidget {
  const ScreenAllSongs({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final heightDsp = MediaQuery.of(context).size.height;
    return (controller.dbAllSongs.isEmpty)
        ? const EmptyListScreenWidget(message: "No Songs Found, Sorry..")
        : Obx(
            () => ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.dbAllSongs.length + 1,
              itemBuilder: (context, index) {
                return (index == controller.dbAllSongs.length)
                    ? SizedBox(
                        height: heightDsp * 0.08,
                      )
                    : SongListTileWidget(
                        currentSong: controller.dbAllSongs[index],
                        convertAudios: controller.convertAllAudios,
                        index: index,
                      );
              },
            ),
          );
  }
}
