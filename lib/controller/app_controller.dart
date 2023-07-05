
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:xplore_music_app/view/allfiles_export.dart';
import 'package:xplore_music_app/view/screens/library/library.dart';


class AppController extends GetxController {
  var selectedIndex = 0.obs;
  var isRepeat = false.obs;
  var isShuffle = false.obs;
  
  void changeSelectedIndex(int index) {
    selectedIndex.value = index;
  }
  
  final screens = <Widget>[
    const ScreenHome(),
    const ScreenFavorites(),
    const ScreenPlaylists(),
    const ScreenSettings(),
  ];
}