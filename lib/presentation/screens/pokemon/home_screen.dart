

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

    final colors = Theme.of(context).colorScheme;
    final verpokemons = ref.watch(homePokemonProvider);
    const String title = 'POKEMONES';

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
        centerTitle: true,
        backgroundColor: colors.primary,
      ),
      body: ListView.builder(
          itemCount: verpokemons.listaPokemons?.length ?? 0,
          itemBuilder: (context, index) {

            final Pokemon? pokemon = verpokemons.listaPokemons?[index];
            final count = verpokemons.listaPokemons?.length ?? 0;
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {

//listado con que se elimina el pokemon y se actuliza la lista
                verpokemons.listaPokemons!
                    .removeWhere((item) => item == pokemon);
                if (verpokemons.listaPokemons != null) {
                  ref
                      .read(homePokemonProvider.notifier)
                      .listChangePokemon(verpokemons.listaPokemons!);
                }

                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                  content: Text('Pokemon ${pokemon?.name} ha quedo eliminado'),
                  backgroundColor: colors.primary,
                  duration: Duration(seconds: 1),
                ));

              },
              background: Container(
                color: colors.primary,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
              ),
              child: ListTile(
                //listado de pokemones
                leading: Icon(Icons.catching_pokemon_outlined),
                title: Text('${pokemon?.name}'),
                trailing: Icon(Icons.arrow_circle_right),
                onTap: () {
                  ref
                      .read(homePokemonProvider.notifier)
                      .consultarPokemon(pokemon?.name ?? 'pikachu');
                  ref.watch(homePokemonProvider);
                  context.pushNamed(DetailPokemon.name);
                  
                },
              ),
            );
            
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(homePokemonProvider.notifier).consultarPokemons();           
          },
        child: const Icon(Icons.list_rounded),
        backgroundColor: colors.primary,
        tooltip: 'Listar pokemones',
      ),
        
    ); 
      

  }
}
