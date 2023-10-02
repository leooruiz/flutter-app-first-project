import 'package:flutter_studies/first_project/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

Future<Database> getDataBase() async {
  final String path = join(await getDatabasesPath(), 'task.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TaskDao.tableSql); //executar tabela
    },
    version: 1,
  );
}
