import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xplore_music_app/controller/controller_export.dart';
import 'package:xplore_music_app/view/allfiles_export.dart';

class ScreenMostly extends StatelessWidget {
  const ScreenMostly({super.key});

  @override
  Widget build(BuildContext context) {
    final MostlyController mController = Get.put(MostlyController());
    final height1 = MediaQuery.of(context).size.height;
    final width1 = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => const ScreenSearch());
              },
              icon:
                  const Icon(Icons.search_sharp, size: 28, color: Colors.white),
            ),
            // SizedBox(
            //   width: width1 * 0.01,
            // ),
            // IconButton(
            //     onPressed: () {
            //       Get.defaultDialog(
            //         title: 'Clear Your Mostly Played Songs',
            //         content: const Text('Are You Sure?'),
            //         actions: [
            //           TextButton(
            //             onPressed: () {
            //               Get.back();
            //             },
            //             child: const Text('Cancel'),
            //           ),
            //           ElevatedButton(
            //             onPressed: () {
            //               mController.clearMostlyPlayedSongs();
            //               Get.back();
            //               Get.snackbar(
            //                 'Mostly Played Songs',
            //                 'Cleared Your Songs',
            //                 colorText: Colors.black,
            //                 duration: const Duration(milliseconds: 1500),
            //                 snackPosition: SnackPosition.BOTTOM,
            //                 backgroundColor: Colors.grey,
            //                 reverseAnimationCurve: Curves.easeOut,
            //               );
            //             },
            //             child: const Text('Clear'),
            //           ),
            //         ],
            //       );
            //     },
            //     icon: const Icon(Icons.clear_all_sharp, size: 28)),
            // SizedBox(
            //   width: width1 * 0.02,
            // ),
          ],
          leading: IconButton(
              onPressed: () {
                // Navigator.pop(context);
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 28,
                color: Colors.white,
              )),
          title: const Text(
            'Mostly Played',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(
          () => (mController.mostlySongs.isEmpty)
              ? const EmptyListScreenWidget(
                  message:
                      "You haven't played anything ! \nPlay What You Love..",
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: mController.mostlySongs.length + 1,
                  itemBuilder: (context, index) {
                    if (index == mController.mostlySongs.length) {
                      return SizedBox(
                        height: height1 * 0.08,
                      );
                    }
                    return MostlyListTileWidget(
                      currentSong: mController.mostlySongs[index],
                      convertAudios: mController.convertMostlyAudios,
                      index: index,
                    );
                  },
                ),
        ),
      ),
    );
  }
}
