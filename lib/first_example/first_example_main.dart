
import 'package:flutter/material.dart';
import 'package:learn_how_to_fetch_data_from_the_internet/first_example/delete_data.dart';
import 'package:learn_how_to_fetch_data_from_the_internet/first_example/fetch_data.dart';
import 'package:learn_how_to_fetch_data_from_the_internet/first_example/send_data.dart';
import 'package:learn_how_to_fetch_data_from_the_internet/first_example/websocket.dart';
import 'package:learn_how_to_fetch_data_from_the_internet/first_example/update_data.dart';


class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

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
                onPressed:() {(Navigator.push(context, MaterialPageRoute(builder: (context)=> const FetchData())));},
                child: const Text("Fetch data example")
            ),

            FilledButton(
                onPressed:() {(Navigator.push(context, MaterialPageRoute(builder: (context)=> const SendData())));},
                child: const Text("Send data example")
            ),

            FilledButton(
                onPressed:() {(Navigator.push(context, MaterialPageRoute(builder: (context)=> const UpdateData())));},
                child: const Text("Update data example")
            ),

            FilledButton(
                onPressed:() {(Navigator.push(context, MaterialPageRoute(builder: (context)=> const DeleteData())));},
                child: const Text("Delete data example")
            ),

            FilledButton(
                onPressed:() {(Navigator.push(context, MaterialPageRoute(builder: (context)=> const WebSocket())));},
                child: const Text("WebSocket data example")
            ),

          ],
        ),
      ),
    );
  }
}


