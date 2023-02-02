import 'package:cs311hw06/app_theme.dart';

import 'pokemon_api.dart';
import 'pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => PokemonListState();
}

class PokemonListState extends State<PokemonList> {
  int currentlySelected = 0; //just like counter

  void onSelected(int index, AppTheme currentTheme) async {
    currentTheme.setTheme(index);
    setState(() {
      currentlySelected = index; //if something was clicked, this state going to change theme color
    });
  }

  @override // Application layout and color
  Widget build(BuildContext context) {
    return Consumer2<PokemonService, AppTheme>(
        builder: (_, pokemonService, currentTheme, __) { // add theme service
          return Scaffold(
            appBar: AppBar(
              title: const Text('Pokemon List'),
              backgroundColor: currentTheme.currentTheme,
            ),
            body: GridView.builder(
              itemCount: pokemonService.pokemonCount,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () => onSelected(index, currentTheme),
                    child: Container( //build box decoration all make the border to black
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 5,
                                color: currentlySelected == index // and then make it change color to type
                                    ? Colors.black
                                    : Colors.white)),
                        child: Image.network(genPokemonImageUrl(index + 1))));
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
        ),
      );
    });
  }
}