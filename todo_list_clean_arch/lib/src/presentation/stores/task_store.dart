import 'package:flutter/material.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';
import 'package:todo_list_clean_arch/src/domain/usecases/read_task_usecase/read_task_usecase.dart';
import 'package:todo_list_clean_arch/src/presentation/states/task_state.dart';

class TaskStore extends ValueNotifier<TaskState> {
  final ReadTaskUsecase readTaskUsecase;
  late List<TaskEntity> taskList;

  TaskStore({required this.readTaskUsecase})
      : super(InitialTaskState());

  Future<dynamic> getTasks() async {
    value = LoadingTaskState();
    var result = await readTaskUsecase();
    return result.fold((error) {
      value = ErrorTaskState(
          message: 'Error when trying to retrieve the tasks: $error');
    }, (sucess) {
      taskList = sucess;
      value = SuccessTaskState(taskList: taskList);
    });
  }

  
}
