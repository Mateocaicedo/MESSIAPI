import 'dart:convert';

class Pokemones{
  List<Pokemon> items = [];

  Pokemones();

  Pokemones.fromJsonList(jsonList){
   if (jsonList == null) return;

    for (var item in jsonList) {
      final pokemon = Pokemon.fromJsonMap(item);
      items.add(pokemon);
    }
  }
}


class Pokemon{
  late String name;
  late String url;

  Pokemon({required this.name, required this.url});

  factory Pokemon.fromJsonMap(Map<String, dynamic> json){
     return Pokemon(
      name: json['name'],
      url: json['sprites']['other']['home']['front_shiny'],
    );
  }
}