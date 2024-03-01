import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testpokemon/presentation/providers/pokemon_provider.dart';

class DetailPokemon extends ConsumerWidget {

  static const name = 'details-pokemon';
  static const link = '$name';
  const DetailPokemon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref)
  {

    final detailsPokemon = ref.read(homePokemonProvider).pokemon;
    
    return Scaffold(
      appBar: AppBar(
          title: Text('${detailsPokemon?.name}'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
              Text('$detailsPokemon.baseExperience')
          ],
        ),
      )
    );
  }
}

