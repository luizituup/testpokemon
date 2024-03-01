class PokemonDetail {
  final String name;
  final int id;
  final int height;
  final int weight;
  final int baseExperience;
  final List<String> abilities;

  PokemonDetail({
    required this.abilities,
    required this.baseExperience,
    required this.height,
    required this.id,
    required this.name,
    required this.weight,
  });
}
