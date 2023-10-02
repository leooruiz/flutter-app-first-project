import 'package:flutter_studies/first_project/components/task.dart';
import 'package:flutter_studies/first_project/data/database.dart';
import 'package:sqflite/sqlite_api.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _difficulty = 'difficulty';
  static const String _name = 'name';
  static const String _image = "image";

  save(Task task) async { //responsável por salvar uma nova task, caso já exista ela dá um update na tarefa com o nome dado.
    print('Iniciando save...');
    final Database bancoDeDados = await getDataBase();
    final itemExists = await find(task.name);
    Map<String, dynamic> taskMap = toMap(task);
    if (itemExists.isEmpty) {
      print('A tarefa não existia.');
      return await bancoDeDados.insert(_tablename, taskMap);
    } else {
      print('A tarefa já existia.');
      return await bancoDeDados.update(_tablename, taskMap,
          where: '$_name = ?', whereArgs: [task.name]);
    }
  } //save = create

  Map<String, dynamic> toMap(Task task) { //responsável por transformar uma tarefa em um map.
    print('Convertendo tarefa em map');
    final Map<String, dynamic> taskMap = Map();
    taskMap[_name] = task.name;
    taskMap[_difficulty] = task.difficulty;
    taskMap[_image] = task.photo;
    print('Mapa de tarefas: $taskMap');
    return taskMap;
  }

  Future<List<Task>> findAll() async { //retorna todas as tasks existentes no banco de dados.
    print("Estamos acessando o findAll");
    final Database bancoDeDados = await getDataBase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print("Procurando dados no banco de dados... Encontrado: $result");
    return toList(result);
  } // leitura

  List<Task> toList(List<Map<String, dynamic>> taskMap) { //converte as tarefas dadas em uma list.
    print('Convertendo to List');
    final List<Task> tasks = [];
    for (Map<String, dynamic> line in taskMap) {
      final Task task = Task(
          name: line[_name],
          photo: line[_image],
          difficulty: line[_difficulty]);
      tasks.add(task);
    }
    print('Lista de tarefas $tasks');
    return tasks;
  }

  Future<List<Task>> find(String taskName) async { //responsável por encontrar uma tarefa específica.
    print('Acessando find...');
    final Database bancoDeDados = await getDataBase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [taskName],
    );
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  } //leitura

  delete(String taskName) async { //Responsável deletar uma tarefa.
    print('Deleting task: $taskName');
    final Database bancoDeDados = await getDataBase();
    return bancoDeDados
        .delete(_tablename, where: '$_name = ?', whereArgs: [taskName]);
  } //delete
}
