import 'package:flutter/material.dart';
import 'package:swipper/models/pokemon.dart';



List<Widget> listPokemones(List<Pokemon> data){
  List<Widget> gifs = [];
  for(var gif in data){
    gifs.add(
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(gif.url),
            fit: BoxFit.contain ), 
            color: Colors.blue[200]
        ),
        child: Text(
          gif.name,
          textAlign:TextAlign.center,
          ),
      ),
    );
  }
  return gifs;
}


List<Widget> listSwiper(List<Pokemon> data){
  List<Widget> gifs = [];
  for(var gif in data){
    gifs.add(
      Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(gif.url),
                fit: BoxFit.contain ),
              color: Colors.blue[200] 
            ),
        )
    );
  }
  return gifs;
}