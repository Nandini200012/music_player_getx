import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xplore_music_app/controller/controller_export.dart';
import 'package:xplore_music_app/view/allfiles_export.dart';

class ScreenPlaylists extends StatelessWidget {
  const ScreenPlaylists({super.key});

  @override
  Widget build(BuildContext context) {
    final PlaylistController controller = Get.put(PlaylistController());
    final heightDsp = MediaQuery.of(context).size.height;
    final widthDsp = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          const CreateAppbarPlaylistWidget(),
          SizedBox(
            width: widthDsp * 0.02,
          )
        ],
        title: const Padding(
          padding: EdgeInsets.only(left: 40.0, bottom: 8.0),
          child: Text(
            'Playlists',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Poppins',
              color: Color.fromARGB(255, 247, 247, 247),
            ),
          ),
        ),
      ),
      body: Obx(
        () => (controller.allDbPlaylists.isEmpty)
            ? const EmptyListScreenWidget(
                message:
                    "You haven't created any  playlist ! \nCreate What You Love..")
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    Row(
                      children: const [
                        Text(
                          'Your Playlists',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: heightDsp * 0.02,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.allDbPlaylists.length,
                      itemBuilder: (context, index) {
                        //controller.fetchCurrentPlaylistSongs(index);
                        final currentPlaylist =
                            controller.allDbPlaylists[index];

                        return PlaylistListTileWidget(
                          index: index,
                          currentPlaylist: currentPlaylist,
                          tileController: controller,
                        );
                      },
                    ),
                  ]),
                ),
              ),
      ),
    );
  }
}
