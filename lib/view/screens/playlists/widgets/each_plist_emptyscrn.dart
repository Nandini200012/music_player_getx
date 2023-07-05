import 'package:flutter/material.dart';
import 'package:xplore_music_app/view/allfiles_export.dart';
import '../../../widgets/empty_list_screen.dart';

class EachPlaylistEmptyScreen extends StatelessWidget {
  const EachPlaylistEmptyScreen({
    super.key,
    required this.playlistName,
  });

  final String playlistName;

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        EachPlaylistAppbarWidget(playlistName: playlistName),
        const Expanded(
          child: EmptyListScreenWidget(
              message: "You haven't added anything ! \nAdd What You Love.."),
        ),
      ],
    );
  }
}


