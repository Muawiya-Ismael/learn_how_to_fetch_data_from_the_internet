
import 'package:flutter/material.dart';
import 'package:learn_how_to_fetch_data_from_the_internet/pokemon/search_a_pokemon.dart';

import 'first_example/first_example_main.dart';

Future <void> main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark
        ),
        home: const HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            FilledButton(
                onPressed:() {(Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyFirstApp())));},
                child: const Text("Fetch data example")
            ),

            FilledButton(
                  onPressed:() {(Navigator.push(context, MaterialPageRoute(builder: (context)=> const SearchAPokemon())));},
                child: const Text("Search a Pokemon")
            ),

          ],
        ),
      ),
    );
  }
}


