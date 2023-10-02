import 'package:flutter/material.dart';
import 'package:flutter_studies/first_project/components/task.dart';
import 'package:flutter_studies/first_project/data/all_level_inheritered.dart';
import 'package:flutter_studies/first_project/data/task_dao.dart';
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
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              //snapshot é reponsável pelos dados do findAll(que vem do banco de dados).
              List<Task>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando')
                      ],
                    ),
                  );
                case ConnectionState.waiting:
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando')
                      ],
                    ),
                  );
                case ConnectionState.active:
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando')
                      ],
                    ),
                  );
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Task task = items[index];
                            return task;
                          });
                    }

                    return const Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 128,
                            ),
                            Text(
                              'Não há nenhuma tarefa',
                              style: TextStyle(fontSize: 32),
                            )
                          ]),
                    );
                  }
                  return const Text('Erro ao carregar tarefas');
              }

              //ListView builder permite que contruamos apenas as tarefas na tela, sem pesar muito para carregar toda a tela, apenas o que está scrollado
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((contextNew) => FormScreen(
                        taskContext: context,
                      )))).then((value) => setState(() {
                print('tarefa criada!');
              }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
