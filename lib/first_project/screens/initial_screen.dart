import 'package:flutter/material.dart';
import 'package:flutter_studies/first_project/data/all_level_inheritered.dart';
import 'package:flutter_studies/first_project/data/task_inherited.dart';
import 'package:flutter_studies/first_project/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});
  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas de Leonardo"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              tooltip: 'Sincronizar níveis',
              icon: const Icon(Icons.sync),
              onPressed: () {
                setState(() {});
              },
            ),
          )
        ],
        bottom: PreferredSize(
            preferredSize: const Size(300, 20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                height: 15,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 10,
                      child: LinearProgressIndicator(
                        value: AllLevelInherited.of(context).overAllLevel /
                            TaskInherited.of(context).taskList.length /
                            18,
                        borderRadius: BorderRadius.circular(8),
                        minHeight: 4,
                        color: const Color.fromARGB(255, 255, 230, 0),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Text(
                      'Nível : ${(AllLevelInherited.of(context).overAllLevel).ceil()}',
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            )),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        children: TaskInherited.of(context).taskList,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((contextNew) => FormScreen(
                        taskContext: context,
                      ))));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
