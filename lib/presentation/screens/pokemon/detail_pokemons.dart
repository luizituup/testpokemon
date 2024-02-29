import 'package:flutter/material.dart';

class DetailPokemon extends StatelessWidget {

  static const name = 'details-pokemon';
  static const link = '$name';
  const DetailPokemon({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('detail pokemon'),
      ),
      body: SafeArea(
        child: Stack(
          children: [

          ],
        ),
      )
    );
  }
}

