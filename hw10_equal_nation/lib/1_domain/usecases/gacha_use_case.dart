import 'dart:math';

import 'package:cs311hw10/1_domain/entities/genshin_character_entity.dart';
import 'package:cs311hw10/2_data/repositories/gacha_repo_impl.dart';
import 'package:flutter/material.dart';
//just random nation first
class GachaUseCase extends ChangeNotifier {
  GenshinCharacterEntity? randomCharacter;
  final gachaRepo = GachaRepoImpl();

  Future<GenshinCharacterEntity> getRandomCharacter() async {
    List<String> nations = ['Mondstadt', 'Liyue', 'Inazuma'];
    final randomNation = nations[Random().nextInt(nations.length)];
    List<String> characters;
    String randomCharacters;

    do {
      characters = await gachaRepo.getCharactersFromApi();
      randomCharacters = characters[Random().nextInt(characters.length)];
      randomCharacter = await gachaRepo.getCharacterInfo(randomCharacters);
    } while (randomCharacter!.nation != randomNation);

    notifyListeners();
    return randomCharacter!;
  }
}