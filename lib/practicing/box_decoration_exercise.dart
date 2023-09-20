import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.check_circle_outline),
            title: const Text('Flutter: first steps!'),
          ),
          body: ListView(
            children: const [
              Flag(),
              Flag(),
              Flag(),
              Flag(),
            ],
          )),
    );
  }
}

class Flag extends StatefulWidget {
  const Flag({super.key});

  @override
  State<Flag> createState() => _FlagState();
}

class _FlagState extends State<Flag> {
  bool showText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black26, width: 10)),
                    width: 80,
                    height: 80,
                    child: const Icon(Icons.supervised_user_circle),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black26, width: 10)),
                    alignment: Alignment.center,
                    width: 80,
                    height: 80,
                    child: const Icon(Icons.supervised_user_circle),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black26, width: 10)),
                    width: 80,
                    height: 80,
                    child: const Icon(Icons.supervised_user_circle),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
