

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testpokemon/domain/entities/pokemon.dart';
import 'package:testpokemon/presentation/providers/pokemon_provider.dart';

class HomeScreen extends ConsumerWidget {

  static const name = 'home-screen';
  static const link = '$name';

  const HomeScreen ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    const title = 'Listado de Pokemones';
    final verpokemons = ref.watch(homePokemonProvider);

    return Scaffold(
      appBar: AppBar(
          title: Text('Lista Pokemones '),
      ),

      );

  }
}
