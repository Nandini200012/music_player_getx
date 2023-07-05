// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xplore_music_app/view/allfiles_export.dart';

import '../../model/db_functions.dart';



class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}


class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    requestPermission();
    goToMyApp();
    // ignore: todo
    // TODO: implement initState
    super.initState();
  
  }

  @override
  void didChangeDependencies() {
    // ignore: todo
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final height1 = MediaQuery.of(context).size.height;
    // final width1 = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
       
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/splashimage.png',
              height: 100,
              width: 100,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  } 

  Future<void> goToMyApp() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.off(() => MyMusicApp());
  }
}
   