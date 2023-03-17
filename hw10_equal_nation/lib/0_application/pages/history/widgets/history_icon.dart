import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:cs311hw10/0_application/pages/history/widgets/history_web.dart';
import 'package:cs311hw10/1_domain/entities/genshin_character_entity.dart';

class HistoryIcon extends StatelessWidget {
  const HistoryIcon({Key? key, required this.character}) : super(key: key);

  final GenshinCharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Image.network(
          'https://api.genshin.dev/characters/'
              '${character.id}/icon-big',
          scale: 1.0,
        ),
        onPressed: () {

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GenshinWebView(
                    character: character,
                  )));
        });
  }
}