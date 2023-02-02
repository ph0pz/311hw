import 'package:flutter/material.dart';
import 'pokemon_api.dart';
// import pokemon_api.dart to get the pokemon name from clicking just like a pokemon_detail.dart file
const Map<String, int> appColor = { // declair all color in assignment
  "Normal": 0xFFA8A77A,
  "Fire": 0xFFEE8130,
  "Water": 0xFF6390F0,
  "Electric": 0xFFF7D02C,
  "Grass": 0xFF7AC74C,
  "Ice": 0xFF96D9D6,
  "Fighting": 0xFFC22E28,
  "Poison": 0xFFA33EA1,
  "Ground": 0xFFE2BF65,
  "Flying": 0xFFA98FF3,
  "Psychic": 0xFFF95587,
  "Bug": 0xFFA6B91A,
  "Rock": 0xFFB6A136,
  "Ghost": 0xFF735797,
  "Dragon": 0xFF6F35FC,
  "Dark": 0xFF705746,
  "Steel": 0xFFB7B7CE,
  "Fairy": 0xFFD685AD
};

class AppTheme extends ChangeNotifier {
  Color currentTheme = Color(appColor["Grass"]!); //set starting them to Grass type


  void setTheme(int index) async { // fetching pokemon name and cut it for only type
    final pokemon = await fetchPokemonInfo(index + 1);
    String types = pokemon.typesToString();
    String firstType = types.split("/")[0];
    final type = firstType;
    currentTheme = Color(appColor[type]!);

    notifyListeners();
  }
}