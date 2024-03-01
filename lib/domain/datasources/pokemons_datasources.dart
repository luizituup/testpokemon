
import 'package:testpokemon/domain/entities/pokemon.dart';
import 'package:testpokemon/domain/entities/pokemonDetail.dart';

abstract class PokemonsDatasources{

  Future<List<Pokemon>> getPokemons();


  Future<PokemonDetail> getPokemonDetail(String nombre);

}