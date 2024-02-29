 class PokemosDB {
    final String name;
    final String url;

    PokemosDB({
        required this.name,
        required this.url,
    });

    factory PokemosDB.fromJson(Map<String, dynamic> json) => PokemosDB(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}