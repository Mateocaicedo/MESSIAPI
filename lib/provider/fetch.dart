import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swipper/models/pokemon.dart';



class  Fetch{
  

  Future<List<Pokemon>>fetch() async{
    const url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
      final resp = await http.get(Uri.parse(url));
      if(resp.statusCode == 200){
        String body = utf8.decode(resp.bodyBytes);
        final jsonData = jsonDecode(body);
        final gifs = Pokemones.fromJsonList(jsonData);
        return gifs.items;
      }else{
        throw Exception("Ocurrio Algo ${resp.statusCode}");
      }
  }
}