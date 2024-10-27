import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:core';
import 'display.dart';

class Translate {
  String transFrom;
  String transTo;
  String date;

  Translate(this.transFrom, this.transTo, this.date);
}

const List<String> translations = [
  "Hello, Hola, 10/26/2024",
  "My name is glorp, Me llamo glorp, 10/26/2024",
  "What day is it?, Que dia es hoy?, 10/26/2024",
  "What time is it?",
  "Que hora es?",
  "10/26/2024",
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menk Travel Log',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 30);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 186, 229, 179),
      appBar: AppBar(title: const Text('glorp logs')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            spacer,
            Align(
              alignment: Alignment.center,
              child: Card(
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Hello()));
                    },
                    child: const Padding(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        child: SizedBox(
                          width: 370,
                          height: 50,
                          child: Text(
                            "Hello, Hola, 10/26/2024",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                            ),
                          ),
                        ))),
              ),
            ),
            spacer,
            Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Hello()));
                  },
                  child: const Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: SizedBox(
                        width: 370,
                        height: 50,
                        child: Text(
                          "Hello, Hola, 10/26/2024",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                          ),
                        ),
                      ))),
            ),
            spacer,
            Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Hello()));
                  },
                  child: const Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: SizedBox(
                        width: 370,
                        height: 50,
                        child: Text(
                          "Hello, Hola, 10/26/2024",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                          ),
                        ),
                      ))),
            ),
            spacer,
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 56, 78, 52),
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                child: const Text(
                  'Return to Home',
                  style: TextStyle(
                      color: Color.fromARGB(255, 186, 229, 179), fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            const Text("")
          ],
        ),
      ),
    );
  }
}
