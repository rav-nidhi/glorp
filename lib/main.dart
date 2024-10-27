import 'package:flutter/material.dart';
import 'dart:core';
import 'display.dart';

class Translate {
  String transFrom;
  String transTo;
  String date;

  Translate(this.transFrom, this.transTo, this.date);
}

List<String> translations = [
  "Hello, Hola, 10/26/2024",
  "My name is glorp, Me llamo glorp, 10/26/2024",
  "What day is it?, Que dia es hoy?, 10/26/2024",
  "What time is it?, Que hora es?, 10/26/2024",
  "Goodbye, Adios, 10/26/2024"
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
  if (parts.length != 3) return Container(); 
  
  String transFrom = parts[0].trim();
  String transTo = parts[1].trim();
  String date = parts[2].trim();

  return Column(
    children: [
      const SizedBox(height: 10),
      Align(
        alignment: Alignment.center,
        child: Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (_) => const Hello()));
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Translated: $transTo',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'From: $transFrom',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Date: $date',
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
