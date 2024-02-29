
import 'package:go_router/go_router.dart';
import 'package:testpokemon/presentation/screens/pokemon/detail_pokemons.dart';
import 'package:testpokemon/presentation/screens/pokemon/home_screen.dart';

final pokemonRouter = GoRouter(
//rutan inicial
  initialLocation: '/',
  routes: [
  GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/details-pokemon',
      name: DetailPokemon.name,
      builder: (context, state) => const DetailPokemon(),
    ),
 ],


);