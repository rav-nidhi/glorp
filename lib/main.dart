import 'package:flutter/material.dart';
import 'dart:core';
import 'display.dart';

List<String> translations = [
  "Hello, Hola, English, Spanish, 10:43, 10/26/2024",
  "My name is glorp, Me llamo glorp, English, Spanish, 23:43, 10/26/2024",
  "What day is it?, Que dia es hoy?, English, Spanish, 9:43, 10/26/2024",
  "What time is it?, Que hora es?, English, Spanish, 10:56, 10/26/2024",
  "Goodbye, Adios, English, Spanish, 10:49, 10/26/2024",
  "It's tea time, Es hora del te, English, Spanish, 10:49, 10/26/2024"
];

// Future<void> nextTranslate(List<Translate> translations) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final filePath = '${directory.path}/SampleReinforce';
//     final file = File(filePath);
//     String response = await file.readAsString();

//     List<String> lines = response.split('\n');
//     for (String line in lines) {
//       if (line.trim().isEmpty) continue; // Skip empty lines
//       List<String> parts = line.split('.');
//       if (parts.length == 3) {
//         reinforceList.add(ReinforceVocab(parts[0].trim(), parts[1].trim(),parts[2].trim()));
//       }
//     }
//     //Bounds checking, no more than five cards
//     while(num_of_reinforce_cards < reinforceList.length && num_of_reinforce_cards < 5) {
//       num_of_reinforce_cards++;
//     }
//     setState(() {});
//   }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'glorp logger',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 186, 229, 179),
      appBar: AppBar(title: const Text('glorp logs')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            for (var i in translations)
              log(context, i)
          ],
        ),
      ),
    );
  }
}

Widget log(BuildContext context, String translation) {
  List<String> parts = translation.split(', ');
  if (parts.length != 6) return Container(); 
  
  String transFrom = parts[0].trim();
  String transTo = parts[1].trim();
  String langFrom = parts[2].trim();
  String langTo = parts[3].trim();
  String time = parts[4].trim();
  String date = parts[5].trim();

  return Column(
    children: [
      const SizedBox(height: 10),
      Align(
        alignment: Alignment.center,
        child: Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Translated ($langTo): $transTo',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'From ($langFrom): $transFrom',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Time: $time',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
