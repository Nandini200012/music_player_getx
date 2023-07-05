// import 'package:flutter/material.dart';
// import 'package:material_color_gen/material_color_gen.dart';

// import 'package:xplore_music_app/view/allfiles_export.dart';

// class ScreenLibrary extends StatelessWidget {
//   const ScreenLibrary({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Padding(
//           padding: EdgeInsets.only(left: 40.0, bottom: 8.0),
//           child: Text(
//             'Library',
//             style: TextStyle(
//               fontSize: 24,
//               fontFamily: 'Poppins',
//               color: Color.fromARGB(255, 245, 245, 245),
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: ListView(children: [
//           Container(
//             padding: const EdgeInsets.all(5),
//             decoration: BoxDecoration(
//               color: const Color(0xFF00010A).toMaterialColor(),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: ListTile(
//               title: const Text(
//                 'Recently Played',
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white),
//               ),
//               onTap: () {},
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           const SettingsListTileWidget(
//             title: "Mostly Played",
//             onPressedPage: PrivacyPolicy(),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           const SettingsListTileWidget(
//             title: "Favourite",
//             onPressedPage: TermsAndCondition(),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           const SettingsListTileWidget(
//             title: "About Us",
//             onPressedPage: AboutDialogWidget(),
//           ),
//         ]),
//       ),
//     );
//   }
// }

