import 'package:flutter/material.dart';
import 'package:swipper/models/pokemon.dart';
import 'package:swipper/provider/fetch.dart';
import 'package:swipper/widgets/pokemones_widgets.dart';

class PageViewPoke extends StatefulWidget {
  const PageViewPoke({super.key});

  @override
  State<PageViewPoke> createState() => _PageViewPokeState();
}

class _PageViewPokeState extends State<PageViewPoke> {
  int page = 0;
  late Future<List<Pokemon>> _pokemones;
  late PageController _scrollController;
  

  @override
  void initState() {
    final fetch = Fetch();
    super.initState();
    _pokemones = fetch.fetch(page);
    _scrollController = PageController(viewportFraction: 1 / 2, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: 160,
      child: FutureBuilder<List<Pokemon>>(
          future: _pokemones,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
               final listPokemone =listPokemones(snapshot.data as List<Pokemon>);
              return PageView.builder(
                itemCount: snapshot.data!.length,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return listPokemone[index] ;
                },
                onPageChanged: (value) {
                  if (value == snapshot.data!.length - 7) {
                    getNewPage();
                  }
                },
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
