import 'my_bottom_navigation.dart';
import 'pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_theme.dart';

// change in code detail only in files pokemon_list.dart and main and create a new file call app_theme to change app theme
void main() {
  runApp(const MyPokemonApp());
}

class MyPokemonApp extends StatelessWidget {
  const MyPokemonApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pokemon Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: ChangeNotifierProvider(
        //   create: (_) => PokemonService(),
        //   child: const MyBottomNavigation(),
        // ),
        home: MultiProvider( // make a new service all Apptheme to get notifier if something happen
          providers: [
            ChangeNotifierProvider<PokemonService>(
              create: (_) => PokemonService(),
            ),
            ChangeNotifierProvider<AppTheme>(
              create: (_) => AppTheme(),
            )
          ],
          child: const MyBottomNavigation(),
        ));
  }
}