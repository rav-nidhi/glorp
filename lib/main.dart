import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:core';

List<Map<String, String>> translations = [
  {"transFrom":"i'm just going to let it do once and then",
        "transTo":"Solo lo dejaré hacer una vez y luego",
        "langFrom":"en",
        "langTo":"es",
        "date":"2024-10-27 09:40:13"},
  {"transFrom":"what's your favorite color",
        "transTo":"¿Cuál es tu color favorito?",
        "langFrom":"en",
        "langTo":"es",
        "date":"2024-10-27 09:41:33"},
  {"transFrom":"i believe purple or red",
        "transTo":"Creo que morado o rojo",
        "langFrom":"en",
        "langTo":"es",
        "date":"2024-10-27 09:41:41"},
  {"transFrom":"what about you",
        "transTo":"qué pasa contigo",
        "langFrom":"en",
        "langTo":"es",
        "date":"2024-10-27 09:41:47"},
  {"transFrom":"what about you",
        "transTo":"qué pasa contigo",
        "langFrom":"en",
        "langTo":"es",
        "date":"2024-10-27 09:41:47"},
  {"transFrom": "It's tea time", "transTo": "Es hora del te", "langFrom": "English", "langTo": "Spanish", "date": "2024-10-23 10:47:30"}
];

void main() {
  runApp(const MyApp());
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
  final TimeOfDay t = TimeOfDay.fromDateTime(DateTime.parse(translations[0]['date']!));
  final String d = DateFormat('EEEE, MMM d, yyyy').format(DateTime.parse(translations[0]['date']!));
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 186, 229, 179),
      appBar: AppBar(title: const Text('glorp logs')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              d,
              style: const TextStyle(
                color: Color.fromARGB(255, 56, 78, 52),
                fontSize: 20,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Card(
                clipBehavior: Clip.hardEdge,
                child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                      width: 350,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Translated (${translations[0]['langTo']}): ${translations[0]['transTo']}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'From (${translations[0]['langFrom']}): ${translations[0]['transFrom']}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            t.format(context),
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

            for (var i=1; i<translations.length; i++)
              log(context, translations[i], translations[i-1]),
            
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}

Widget log(BuildContext context, Map<String, String> translation, Map<String, String> prev) {
  DateTime dateTime = DateTime.parse(translation['date']!);
  DateTime prevDateTime = DateTime.parse(prev['date']!);

  TimeOfDay time = TimeOfDay.fromDateTime(dateTime);
  String date = DateFormat('EEEE, MMM d, yyyy').format(dateTime);
  String prevDate = DateFormat('EEEE, MMM d, yyyy').format(prevDateTime);

  if(prevDate == date){
    return Column(
      children: [
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.center,
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  width: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Translated (${translation['langTo']}): ${translation['transTo']}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'From (${translation['langFrom']}): ${translation['transFrom']}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        time.format(context),
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
      ],
    );
  }
  else {
    return Column(
      children: [
        const SizedBox(height: 10),
        Text(
          date,
          style: const TextStyle(
            color: Color.fromARGB(255, 56, 78, 52),
            fontSize: 20,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  width: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Translated (${translation['langTo']}): ${translation['transTo']}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'From (${translation['langFrom']}): ${translation['transFrom']}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        time.format(context),
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
      ],
    );
  }
}
