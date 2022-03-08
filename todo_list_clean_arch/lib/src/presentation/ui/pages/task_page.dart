import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';
import 'package:todo_list_clean_arch/src/presentation/controllers/task_controller.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late final TaskController _controller;
  final TextEditingController _controllerText = TextEditingController();
  late Future<dynamic> _list;

  @override
  void initState() {
    super.initState();
    _controller = GetIt.I.get<TaskController>();
    _list = _controller.readTasks();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildContainer() {
      return FutureBuilder<dynamic>(
          future: _list,
          //initialData: ,
          builder: (_, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  print("Error ${snapshot.error}");
                  return const Center(child: Text("Somer error occured"));
                } else {
                  final tasks = snapshot.data;
                  print("Snapshot ${snapshot.data}");
                  return tasks?.isEmpty
                      ? const Center(
                          child: Text("Você ainda não salvou nenhuma tarefa"))
                      : ListView.builder(
                          itemCount: tasks?.length,
                          itemBuilder: (_, index) {
                            final task = tasks?[index];
                            return ListTile(
                                title: Text(
                                  task!.task,
                                  style: TextStyle(
                                      decoration: task.statusTask
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none),
                                ),
                                onTap: () {
                                  setState(() {
                                    task.statusTask = !task.statusTask;
                                  });
                                });
                          });
                }
            }
          });
    }

    Widget showAlertDialog() {
      return AlertDialog(
        title: const Text("Inserir Tarefa"),
        content: TextField(
          controller: _controllerText,
          keyboardType: TextInputType.text,
        ),
        actions: [
          TextButton(
              onPressed: () async {
                TaskEntity task =
                    TaskEntity(task: _controllerText.text, statusTask: false);
                var result = await _controller.saveTask(task);
                debugPrint("Resultado do salvamento $result");
                Navigator.pop(context, 'Salvar');
              },
              child: const Text("Salvar"))
        ],
      );
    }

    return Scaffold(
        appBar: AppBar(title: const Text("To Do List")),
        body: buildContainer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () =>
              showDialog(context: context, builder: (_) => showAlertDialog()),
        ));
  }
}
