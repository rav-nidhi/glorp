import 'package:flutter/material.dart';
import 'main.dart';

class Hello extends StatelessWidget {
  const Hello({super.key});

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 30);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 186, 229, 179),
      appBar: AppBar(
        title: const Text("Hello"),
        surfaceTintColor: const Color.fromARGB(255, 186, 229, 179),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 350,
                )),
            spacer,
            const Card(
                clipBehavior: Clip.hardEdge,
                child: SizedBox(
                    width: 385,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(children: <Widget>[
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Translated: Hola',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 20),
                            )),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'To: Hello',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 20),
                            )),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Time Asked: 10/26/2024 22:46',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 20),
                            )),
                      ]),
                    ))),
            const SizedBox(height: 30),
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
                      color: Color.fromARGB(255, 186, 229, 179),
                      fontSize: 25),
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
