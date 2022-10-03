import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:swipper/models/pokemon.dart';
import 'package:swipper/provider/fetch.dart';
import 'package:swipper/widgets/bodies/page_body.dart';
import 'package:swipper/widgets/bodies/swiper_page.dart';
import 'package:swipper/widgets/pokemones_widgets.dart';

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({Key? key}) : super(key: key);

  @override
  State<MyHomeApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomeApp> {

 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Messi API"),
      ),
      body: Column(
        
        // ignore: prefer_const_literals_to_create_immutables
        children: [
           const Expanded(flex: 1,child: PageViewPoke()),
           const Expanded(flex: 2,child: SwiperPage()), 
        ],
      ),
    );
  }
}
