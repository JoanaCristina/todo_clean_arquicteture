import 'package:flutter/material.dart';
import 'package:todo_list_clean_arch/src/core/inject/inject.dart';
import 'package:todo_list_clean_arch/src/core/local_db/hive.dart';
import 'package:todo_list_clean_arch/src/presentation/ui/pages/task_page.dart';

void main() async {
  Inject.init();
  var _hiveDB = HiveDb();
  _hiveDB
    ..initDb
    ..createBox(boxName: 'taskBox');

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const TaskPage()));
}
