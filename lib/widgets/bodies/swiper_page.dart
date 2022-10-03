import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipper/models/pokemon.dart';
import 'package:swipper/provider/fetch.dart';
import 'package:swipper/widgets/pokemones_widgets.dart';

class SwiperPage extends StatefulWidget {
  const SwiperPage({super.key});

  @override
  State<SwiperPage> createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
  late Future<List<Pokemon>> _pokemones;

  final fetch = Fetch();
  int page = 0;

  @override
  void initState() {
    super.initState();
    _pokemones = fetch.fetch(page);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: FutureBuilder<List<Pokemon>>(
          future: _pokemones,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final listPokemone = listSwiper(snapshot.data as List<Pokemon>);
              return Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return listPokemone[index];
                },
                itemCount: snapshot.data!.length,
                itemWidth: 300.0,
                itemHeight: 320,
                onIndexChanged: ((value) {
                  if (value == snapshot.data!.length - 7) {
                    getNewPage();
                  }
                }),
                layout: SwiperLayout.STACK,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  getNewPage() async {
    final getprovider = Fetch();
    page += 10;
    await getprovider.fetch(page).then((value) {
      setState(() {
        _pokemones.then((pokemons) => pokemons.addAll(value));
      });
    });
  }
}
