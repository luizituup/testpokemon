

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:testpokemon/domain/entities/pokemon.dart';
import 'package:testpokemon/presentation/providers/pokemon_provider.dart';
import 'package:testpokemon/presentation/screens/pokemon/detail_pokemons.dart';

class HomeScreen extends ConsumerWidget {

  static const name = 'home-screen';
  static const link = '$name';

  const HomeScreen ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final verpokemons = ref.watch(homePokemonProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista Pokemones'),
      ),
      body: ListView.builder(
          itemCount: verpokemons.listaPokemons?.length ?? 0,
          itemBuilder: (context, index) {
            
            
              final Pokemon? pokemon = verpokemons.listaPokemons?[index];
      
            return ListTile(
              //listado de pokemones
              leading: Icon(Icons.catching_pokemon_outlined),
              title: Text('${pokemon?.name}'),
              trailing: Icon(Icons.arrow_circle_right),
              onTap: () {
                ref.read(homePokemonProvider.notifier).consultarPokemon(pokemon?.name ?? 'pikachu');
                context.pushNamed(DetailPokemon.name);
              },
            );
            
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(homePokemonProvider.notifier).consultarPokemons();
          },
          child: const Icon(Icons.access_alarm)),
    ); 
      

  }
}
