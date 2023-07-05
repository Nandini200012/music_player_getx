import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xplore_music_app/controller/controller_export.dart';
import 'package:xplore_music_app/view/allfiles_export.dart';

class ScreenHome extends StatelessWidget {
  //final String title;
  const ScreenHome({super.key});

  //List<MostlyPlayed> mostlySongs = [];
  //var time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    final heightDsp = MediaQuery.of(context).size.height;
    final widthDsp = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: widthDsp * 0.03),
          child: const CircleAvatar(
            radius: 10,
            //backgroundImage: AssetImage('assets/images/music_icon.jpg'),
          ),
        ),
        // title: Obx(
        //   () => Text(
        //     (homeController.time.value.hour < 12)
        //         ? 'Good Morning!'
        //         : ((homeController.time.value.hour < 17) 
        //         ? 'Good Afternoon!' 
        //         : 'Good Evening!'),
        //     style: const TextStyle(
        //       fontSize: 24,
        //       fontFamily: 'HappyMonkey',
        //       fontWeight: FontWeight.bold,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const ScreenSearch());
            },
            icon: const Icon(Icons.search_sharp,
                size: 28, color: Color.fromARGB(255, 252, 252, 252)),
          ),
          SizedBox(
            width: widthDsp * 0.02,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: widthDsp * 0.025,
            right: widthDsp * 0.025,
            top: heightDsp * 0.01),
        child: SingleChildScrollView(
          child: Flex(
            direction: Axis.vertical,
            children: [
              Column(
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Discover!',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: heightDsp * 0.008,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeMainButtonWidget(title: 'Recently Played',),
                      HomeMainButtonWidget(title: 'Mostly Played',),
                    ],
                  ),
                  SizedBox(
                    height: heightDsp * 0.007,
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Find Your Music',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 0.3,
                    color: Colors.white,
                  ),
                  // const ScreenAllSongs(),
                ],
              ),
              const ScreenAllSongs(),
            ],
          ),
        ),
      ),
    );
  }
}

