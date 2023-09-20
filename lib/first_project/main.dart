import 'package:flutter/material.dart';
import 'package:flutter_studies/first_project/data/all_level_inheritered.dart';
import 'package:flutter_studies/first_project/data/task_inherited.dart';
import 'package:flutter_studies/first_project/screens/initial_screen.dart';

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
      home: AllLevelInherited(child: TaskInherited(child: const InitialScreen())),
    );
  }
}
// tentar adicionar funcionalidade de mudar de cor a barra de tarefa quando chega no nível máximo, dando reset no level e alterando instantanemante a cor da barra azul.
