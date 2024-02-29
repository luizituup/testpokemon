import 'package:testpokemon/infrastructure/models/response/pokemondb_response.dart';

class PokemonResponse {
    final int count;
    final dynamic next;
    final dynamic previous;
    final List<PokemosDB> results;

    PokemonResponse({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });

    factory PokemonResponse.fromJson(Map<String, dynamic> json) => PokemonResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<PokemosDB>.from(json["results"].map((x) => PokemosDB.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}
