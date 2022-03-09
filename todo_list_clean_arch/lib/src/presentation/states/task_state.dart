import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';

abstract class TaskState {}

class InitialTaskState implements TaskState {}

class SuccessTaskState implements TaskState {
  late final List<TaskEntity> taskList;
  SuccessTaskState({
    required this.taskList,
  });
}

class LoadingTaskState implements TaskState {}

class ErrorTaskState implements TaskState {
  late final String message;
  ErrorTaskState({
    required this.message,
  });
}
