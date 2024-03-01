import 'package:testpokemon/domain/entities/pokemonDetail.dart';
import 'package:testpokemon/infrastructure/models/response/pokemononly_response.dart';

class PokemonDetailMapper {
  static PokemonDetail pokemonDetailsRemoteToEntity(
          PokemonDetailResponse pokemonDetail) =>
      PokemonDetail(
        abilities: pokemonDetail.abilities.map((e) => e.toString()).toList(), 
        baseExperience: pokemonDetail.baseExperience, 
        height: pokemonDetail.height, 
        id: pokemonDetail.id, 
        name: pokemonDetail.name, 
          weight: pokemonDetail.weight,
          sprites: pokemonDetail.sprites
    );
}
