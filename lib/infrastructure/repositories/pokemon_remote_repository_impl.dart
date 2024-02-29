import 'package:testpokemon/domain/datasources/pokemons_datasources.dart';
import 'package:testpokemon/domain/entities/pokemon.dart';
import 'package:testpokemon/domain/repositories/pokemons_repository.dart';

class PokemonRemoteRepositoryImpl extends PokemonsRepository{

final PokemonsDatasources datasources;

  PokemonRemoteRepositoryImpl( this.datasources);

  @override
  Future<List<Pokemon>> getPokemons() {

    return this.datasources.getPokemons();


  }
  
}