//1. estado del provider

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testpokemon/domain/entities/pokemon.dart';
import 'package:testpokemon/domain/entities/pokemonDetail.dart';
import 'package:testpokemon/infrastructure/repositories/pokemon_remote_repository_impl.dart';
import 'package:testpokemon/presentation/providers/pokemon_repository_provider.dart';

final homePokemonProvider =
    StateNotifierProvider<HomePokemonNotifier, HomePokemonState>((ref) {
  //retornar una instancia del notificador, los ref visualizan los otros providers
     final PokemonRemoteRepositoryImpl pokemonRepository =  ref.watch(pokemonRepositoryProvider);

  return HomePokemonNotifier( pokemonRepository: pokemonRepository);
});



//2. Notificador del provider

class HomePokemonNotifier extends StateNotifier<HomePokemonState> {

  final PokemonRemoteRepositoryImpl pokemonRepository;

  HomePokemonNotifier({required this.pokemonRepository})
      : super(HomePokemonState());

  void consultarPokemons() async {
    final List<Pokemon> getPokemon = await pokemonRepository.getPokemons();
    state = state.copyWith(listaPokemons: getPokemon);
  }

  void consultarPokemon(String name) async {
    final PokemonDetail pokemonDetail =
        await pokemonRepository.getPokemonDetail(name);
    state = state.copyWith(pokemon: pokemonDetail);
  }
}



//3. clase sencilla -- Estados

class HomePokemonState {
  final List<Pokemon>? listaPokemons;
  final PokemonDetail? pokemon;

  HomePokemonState({this.listaPokemons, this.pokemon});

  copyWith({
    List<Pokemon>? listaPokemons,
    PokemonDetail? pokemon,
  }) {
    return HomePokemonState(
        listaPokemons: listaPokemons ?? this.listaPokemons,
        pokemon: pokemon ?? this.pokemon);
  }
}
