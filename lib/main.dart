import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:material_color_gen/material_color_gen.dart';
import 'package:xplore_music_app/model/database/db_all_models.dart';
import 'package:xplore_music_app/model/db_functions.dart';
import 'package:xplore_music_app/view/allfiles_export.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(AllSongsAdapter());
  await Hive.openBox<AllSongs>(boxname);
  runApp(const MyApp());

  Hive.registerAdapter(RecentlyPlayedAdapter());
  openRecentlyPlayedDb();

  Hive.registerAdapter(MostlyPlayedAdapter());
  openMostlyPlayedDb();

  Hive.registerAdapter(FavoritesAdapter());
  openFavoriteSongsDb();

  Hive.registerAdapter(PlaylistsAdapter());
  openPlaylistsDb();

  Hive.registerAdapter(RecentSearchesAdapter());
  openRecentSearchesDb();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saptak',
      theme: ThemeData(
        primarySwatch: const Color(0xFF00010A).toMaterialColor(),
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color.fromARGB(255, 0,3,34),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.transparent),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Color.fromARGB(255, 248, 248, 248)),
          // shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))),
        ),
      ),
      home: const ScreenSplash(),
    );
  }
}
