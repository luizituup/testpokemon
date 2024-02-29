
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testpokemon/config/router/pokemon_router.dart';
import 'package:testpokemon/config/theme/pokemon_theme.dart';


Future main() async{
  runApp(const ProviderScope(child: MainApp()));
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: pokemonRouter,
      title: 'Pokemon app',
      debugShowCheckedModeBanner: false,
      theme: PokemonTheme().getTheme(),
      
    );
  }
}