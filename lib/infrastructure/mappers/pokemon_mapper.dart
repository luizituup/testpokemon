import 'package:testpokemon/domain/entities/pokemon.dart';

import 'package:testpokemon/infrastructure/models/response/pokemondb_response.dart';

class PokemonMapper{

//mapear la respuesta del endpoint con la entidad
static Pokemon pokemonRemoteToEntity(PokemosDB pokemonDB) => 
Pokemon(
    name: pokemonDB.name, 
    url: pokemonDB.url
  );

}