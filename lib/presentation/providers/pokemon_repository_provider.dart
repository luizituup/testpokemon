

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testpokemon/infrastructure/datasources/pokemon_remote_datasource_impl.dart';
import 'package:testpokemon/infrastructure/repositories/pokemon_remote_repository_impl.dart';

final pokemonRepositoryProvider = Provider((ref) {

return PokemonRemoteRepositoryImpl(PokemonRemoteDatasourceImpl());

}); //provider para Repo