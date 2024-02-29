
import 'package:testpokemon/domain/entities/pokemon.dart';

abstract class PokemonsDatasources{

  Future<List<Pokemon>> getPokemons();

}