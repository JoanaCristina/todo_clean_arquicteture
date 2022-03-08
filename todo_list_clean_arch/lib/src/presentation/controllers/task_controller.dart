import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';
import 'package:todo_list_clean_arch/src/domain/usecases/delete_task_usecase/delete_task_usecase.dart';
import 'package:todo_list_clean_arch/src/domain/usecases/edit_task_usecase/edit_task_usecase.dart';
import 'package:todo_list_clean_arch/src/domain/usecases/read_task_usecase/read_task_usecase.dart';
import 'package:todo_list_clean_arch/src/domain/usecases/save_task_usecase/save_task_usecase.dart';

class TaskController extends ChangeNotifier {
//Responsável por fazer as chamads as regras de negocio(usecases)

  final SaveTaskUsecase _saveTaskUsecase;
  final ReadTaskUsecase _readTaskUsecase;
  final EditTaskUsecase _editTaskUsecase;
  final DeleteTaskUsecase _deleteTaskUsecase;

  TaskController(this._saveTaskUsecase, this._readTaskUsecase,
      this._editTaskUsecase, this._deleteTaskUsecase) {
    //readTasks();
  }

  late List<TaskEntity> taskList;

  Future<dynamic> saveTask(TaskEntity task) async {
    var result = await _saveTaskUsecase(taskEntity: task);
    return result.fold((error) => error, (sucess) => true);
  }

  Future<dynamic> readTasks() async {
    var result = await _readTaskUsecase();
    return result.fold((error) => error, (sucess) => taskList = sucess);
    
  }

  editTask(TaskEntity task) async {
    var result = await _editTaskUsecase(taskEntity: task);
  }

  deleteTask(TaskEntity task) async {
    var result = await _deleteTaskUsecase(taskEntity: task);
  }
}
