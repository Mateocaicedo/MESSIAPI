import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({Key? key}) : super(key: key);

  @override
  State<MyHomeApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomeApp> {
  late PageController _pageController;


  List<String> images = [
    "https://www.fcbarcelona.com/fcbarcelona/photo/2022/08/02/ae5252d1-b79b-4950-9e34-6e67fac09bb0/LeoMessi20092010_pic_fcb-arsenal62.jpg",
    "https://imagenes.elpais.com/resizer/elGQL0GmeUTR_xUL3rrpOkMVwx8=/1960x1470/filters:focal(1745x609:1755x619)/cloudfront-eu-central-1.images.arcpublishing.com/prisa/7G364PMCSFGIHFZNHHJLNQL4SU.jpg",
    "https://phantom-marca.unidadeditorial.es/b044da8f983d608a03cbec23ba3257c3/resize/1320/f/jpg/assets/multimedia/imagenes/2022/09/28/16643499513740.jpg",
    "https://img.olympicchannel.com/images/image/private/t_social_share_thumb/f_auto/primary/wfrhxc0kh2vvq77sonki"
  ];
  @override
  void initState() {

    super.initState();

    _pageController = PageController();

    _pageController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Messi API"),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            height: 160,

            child: PageView.builder(
              itemCount: images.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(images[index]),
                      fit: BoxFit.fill ), 
                  ),
                 
                );
              },
            ),
          ),
          Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(images[index]),
                      fit: BoxFit.fill ), 
                  ),
              );
            },
            itemCount: images.length,
            itemWidth: 300.0,
            itemHeight: 400,
            layout: SwiperLayout.STACK,
          ),
        ],
      ),
    );
  }
}
