import 'package:flutter/material.dart';
import 'main.dart';

class Hello extends StatelessWidget {
  const Hello({super.key});

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 30);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 179, 229),
      appBar: AppBar(
        title: const Text("Hello"),
        surfaceTintColor: Color.fromARGB(255, 224, 179, 229),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 350,
                )),
            const SizedBox(height: 250),
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
                  color: Color.fromARGB(255, 73, 37, 157),
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                child: const Text(
                  'Return to Home',
                  style: TextStyle(
                      color: Color.fromARGB(255, 182, 166, 194), fontSize: 25),
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
