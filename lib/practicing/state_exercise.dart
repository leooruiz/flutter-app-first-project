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
              Flag(name: 'Leonardo'),
              Flag(name: 'Gabriel'),
              Flag(name: 'Julia'),
              Flag(name: 'Regiane'),
            ],
          )),
    );
  }
}

class Flag extends StatefulWidget {
  final String name;
  const Flag({super.key, required this.name});

  @override
  State<Flag> createState() => _FlagState();
}

class _FlagState extends State<Flag> {
  bool showText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Row(
          children: [
            Container(
              color: Colors.pink,
              width: 100,
              height: 150,
            ),
            Container(
              alignment: AlignmentDirectional.center,
              color: const Color.fromARGB(255, 255, 234, 234),
              width: 100,
              height: 150,
              child: showText ? Text(widget.name) : const SizedBox.shrink(),
            ),
            Container(
              color: Colors.lightBlue,
              width: 100,
              height: 150,
            ),
            Expanded(
                child: FloatingActionButton(
                    backgroundColor: Colors.amber,
                    mini: true,
                    onPressed: () {
                      setState(() {
                        showText = !showText;
                      });
                    }))
          ],
        ),
      ]),
    );
  }
}
