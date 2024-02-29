

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
    final navegation = DetailPokemon();

    const title = 'Listado de Pokemones';
    final verpokemons = ref.watch(homePokemonProvider);

    return Scaffold(
      appBar: AppBar(
          title: Text('Lista Pokemones '),
      ),
      body: ListView.builder(
          itemCount: verpokemons.listaPokemons?.length ?? 0  ,
          itemBuilder: (context, index){
            final String? listadoPokemonesIndex = verpokemons.listaPokemons?[index].name;

            return ListTile( //listado de pokemones
              title: Text('$listadoPokemonesIndex'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              onTap: (){
                context.pushNamed(DetailPokemon.name);
              },
            );
          }
      ),

      );

  }
}
