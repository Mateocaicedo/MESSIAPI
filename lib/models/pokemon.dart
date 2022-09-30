import 'dart:convert';

class Pokemones{
  List<Pokemon> items = [];

  Pokemones();

  Pokemones.fromJsonList(jsonList){
    if(jsonList== null) return;
    for( var item in jsonList['pokemon']){
        final gif = Pokemon.fromJsonMap(item);
        items.add(gif);
    }
  }
}


class Pokemon{
  late String name;
  late String url;

  Pokemon(this.name, this.url);

  Pokemon.fromJsonMap(Map<String, dynamic> json){
    name = json["name"];
    url = json["img"];
  }
}