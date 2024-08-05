import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Pokemon> getPokemon(String name) async{
  final response = await http.get(
    Uri.parse("https://pokeapi.co/api/v2/pokemon/$name")
  );
  if (response.statusCode == 200) {
    return Pokemon.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}

class Pokemon {

  const Pokemon({required this.id, required this.name, required this. imageUrl});

  final int id;
  final String name;
  final String imageUrl;

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'id': int id,
      'name': String name,
      'sprites': {'front_default': String imageUrl}
    } =>
      Pokemon(
        id: id,
        name: name,
        imageUrl:imageUrl,
      ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}


class SearchAPokemon extends StatefulWidget {
  const SearchAPokemon({super.key});

  @override
  State<SearchAPokemon> createState() => _SearchAPokemonState();
}

class _SearchAPokemonState extends State<SearchAPokemon> {
  final TextEditingController _controller = TextEditingController();

  late Future<Pokemon> _futurePokemon = Future.value(const Pokemon(id: 0, name: '', imageUrl: ''));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search", style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: _controller,
                decoration: const InputDecoration(hintText: 'Pokemon name')
            ),

            FilledButton(
              onPressed: (){
                setState(() {
                  _futurePokemon = getPokemon(_controller.text.toLowerCase());
                });
                Navigator.push(context, MaterialPageRoute(builder: (context)=> pokemonDetails()));
              },
              child: const Text("Search", style:TextStyle(fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }

  Widget pokemonDetails() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon Details"), // Use a static title for the AppBar
      ),
      body: Center( // Wrap FutureBuilder in Center for better layout
        child: FutureBuilder<Pokemon>(
          future: _futurePokemon,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(snapshot.data!.imageUrl), // Display image
                  Text(snapshot.data!.name),
                ],
              );
            } else if (snapshot.hasError) {return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
  //pikachu
}
