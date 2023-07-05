import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xplore_music_app/controller/controller_export.dart';
import 'package:xplore_music_app/view/allfiles_export.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  // bool isSearched = false;
  @override
  Widget build(BuildContext context) {
    //final SearchController sController = Get.put(SearchController());
 final SearcchController sController=Get.put(SearcchController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 28,
              color: Colors.white,
            )),
        title: const SearchAppbarWidget(),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(8),
          child: (sController.isSearched.value)
              ? const SongSearchingScreenWidget()
              : const SearchedScreenWidget(),
        ),
      ),
    );
  }
}

