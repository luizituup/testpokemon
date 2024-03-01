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

final seePokemons = ref.watch(homePokemonProvider).pokemon;

    final detailsPokemon = ref.read(homePokemonProvider).pokemon;
    final String link = detailsPokemon?.sprites.backDefault ??
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/2.png';
    
    
    return Scaffold(
      appBar: AppBar(
          title: Text('${detailsPokemon?.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
              child: Image.network(
                link,
                fit: BoxFit.cover,
              ),
                   
                ),
            SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Id: ${detailsPokemon?.id}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Nombre: ${detailsPokemon?.name}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Height: ${detailsPokemon?.height}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Weidht: ${detailsPokemon?.weight}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Base Exp: ${detailsPokemon?.baseExperience}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  
  }
}

