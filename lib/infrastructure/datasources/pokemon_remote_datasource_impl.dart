


import 'package:dio/dio.dart';
import 'package:testpokemon/domain/datasources/pokemons_datasources.dart';
import 'package:testpokemon/domain/entities/pokemon.dart';
import 'package:testpokemon/infrastructure/mappers/pokemon_mapper.dart';
import 'package:testpokemon/infrastructure/models/response/pokemon_response.dart';

class PokemonRemoteDatasourceImpl extends PokemonsDatasources {

//Variable de base del endpoint
final dio = Dio(BaseOptions(
    baseUrl: 'https://pokeapi.co/api/v2',
  queryParameters: {'limit' : '11' , 'offset' :' 0'}
      ));

  @override
  Future<List<Pokemon>> getPokemons() async {

//path del endpoint
final response = await dio.get('/pokemon');

//transformar la data a un mapa
final pokemonRemoteResponse = PokemonResponse.fromJson(response.data);

//transformar la data a una lista
final List<Pokemon> pokemons = pokemonRemoteResponse.results
.map((pokemonDB) => PokemonMapper.pokemonRemoteToEntity(pokemonDB))
.toList();

 return pokemons;

  }
  
}