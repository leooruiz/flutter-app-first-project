import 'package:flutter/material.dart';
import 'package:flutter_studies/first_project/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task(
      name: 'Aprender Flutter',
      photo: 'lib/first_project/assets/imgs/dash.png',
      difficulty: 3,
    ),
    Task(
      name: 'Treinar',
      photo: 'lib/first_project/assets/imgs/gym.jpeg',
      difficulty: 4,
    ),
    Task(
      name: 'Jogar basquete',
      photo: 'lib/first_project/assets/imgs/basketball.jpeg',
      difficulty: 1,
    ),
    Task(
      name: 'Fazer dieta',
      photo: 'lib/first_project/assets/imgs/apple.webp',
      difficulty: 3,
    ),
    Task(
      name: 'Jogar videogame',
      photo: 'lib/first_project/assets/imgs/games.webp',
      difficulty: 1,
    ),
    Task(
      name: 'Fazer trabalho da faculdade',
      photo: 'lib/first_project/assets/imgs/coworking.jpeg',
      difficulty: 5,
    ),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name: name, photo: photo, difficulty: difficulty));
  }

  static TaskInherited of(BuildContext context) {
    TaskInherited? result = context.dependOnInheritedWidgetOfExactType();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length !=
        taskList
            .length; //retornará true quando o valor atual da tasklist for dferente do antigo, ou seja, irá observar se há a mudança na list, caso sim, return true.
  }
}
