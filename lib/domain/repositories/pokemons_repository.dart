import 'package:testpokemon/domain/entities/pokemon.dart';

abstract class PokemonsRepository{

  Future<List<Pokemon>> getPokemons();

}