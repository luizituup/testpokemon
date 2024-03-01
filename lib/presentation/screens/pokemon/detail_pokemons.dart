import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testpokemon/presentation/providers/pokemon_provider.dart';

class DetailPokemon extends ConsumerWidget {

  static const name = 'details-pokemon';
  static const link = '$name';
  const DetailPokemon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref)
  {
    final colors = Theme.of(context).colorScheme;
final seePokemons = ref.watch(homePokemonProvider).pokemon;

    final detailsPokemon = ref.read(homePokemonProvider).pokemon;
    final String link = detailsPokemon?.sprites.frontDefault ??
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/2.png';
    
    if (link == null) {
      return const Scaffold(
          body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ));
    }
    
    return Scaffold(
      appBar: AppBar(
          title: Text('${detailsPokemon?.name}'),
        backgroundColor: colors.primary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  width: 150.0,
                  height: 150.0,
                  child: Image.network(
                link,
                fit: BoxFit.cover,
                  )
              ),
                   
                ),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Identified: ${detailsPokemon?.id}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Name: ${detailsPokemon?.name}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Height: ${detailsPokemon?.height}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Weidht: ${detailsPokemon?.weight}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Base Exp: ${detailsPokemon?.baseExperience}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  
  }
}

