import 'package:flutter/material.dart';
import 'package:swipper/Pages/Home_page.dart';


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Messi api',
     initialRoute: '/',
     routes: {
       '/': (BuildContext context) => const MyHomeApp(
  
       )
     },
   );
  }
}