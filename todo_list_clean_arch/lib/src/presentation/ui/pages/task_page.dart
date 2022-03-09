import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';
import 'package:todo_list_clean_arch/src/presentation/controllers/task_controller.dart';
import 'package:todo_list_clean_arch/src/presentation/states/task_state.dart';
import 'package:todo_list_clean_arch/src/presentation/stores/task_store.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late final TaskController _controller;
  late final store;
  final TextEditingController _controllerText = TextEditingController();
 
  

  @override
  void initState() {
    super.initState();
    _controller = GetIt.I.get<TaskController>();
    store = GetIt.I.get<TaskStore>();
    store.getTasks();
  
  }

  @override
  Widget build(BuildContext context) {
    

    Widget buildValueNotifier() {
      return ValueListenableBuilder(
          valueListenable: store,
          builder: (_, state, child) {
            if (state is LoadingTaskState) {
              print("Loading....");
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ErrorTaskState) {
              print("Error....");
              return const Center(child: Text("Erro ao carregar tarefas"));
            }

            if (state is SuccessTaskState) {
              print("Success....");
              return store.taskList?.isEmpty
                  ? const Center(
                      child: Text("Você ainda não salvou nenhuma tarefa"))
                  : ListView.builder(
                      itemCount: store.taskList.length,
                      itemBuilder: (_, index) {
                        final task = store.taskList[index];
                        return ListTile(
                          title: Text(task.task),
                        );
                      });
            }
            print("Nothing....");
            return Container();
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
                if (result) {
                  debugPrint("Resultado do salvamento $result");
                  _controllerText.text = "";
                  Navigator.pop(context, 'Salvar');
               
                  store.getTasks();
                } else {
                  debugPrint("Deu ruim $result");
                }
              },
              child: const Text("Salvar"))
        ],
      );
    }

    return Scaffold(
        appBar: AppBar(title: const Text("To Do List")),
        body: buildValueNotifier(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () =>
              showDialog(context: context, builder: (_) => showAlertDialog()),
        ));
  }
}
