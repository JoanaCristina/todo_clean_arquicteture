import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';

class TaskDto extends TaskEntity {
  
  String newTask;
  bool newStatusTask;
  int newId;
  

  TaskDto({required this.newTask, required this.newStatusTask, required this.newId})
      : super(task: newTask, statusTask: newStatusTask);

  Map<String, dynamic> toMap() {
    return {
      'id': newId, 
      'task': newTask, 
      'statusTask': newStatusTask};
  }


  


 factory TaskDto.fromMap(Map<String, dynamic> map) {
    return TaskDto(
      newTask: map ['task'] as String, 
      newStatusTask:map['statusTask'] as bool, 
      newId: map['id'] as int );
  }
}
