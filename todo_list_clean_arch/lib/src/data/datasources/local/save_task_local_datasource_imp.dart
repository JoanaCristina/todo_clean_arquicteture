import 'package:dartz/dartz.dart';
import 'package:todo_list_clean_arch/src/core/local_db/hive.dart';
import 'package:todo_list_clean_arch/src/data/datasources/save_task_datasource.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';

class SaveTaskLocalDatasourceImp implements SaveTaskDatasource {
  final HiveDb db;
  SaveTaskLocalDatasourceImp({required this.db});

  @override
  Future<Either<Exception, bool>> call({required TaskEntity taskEntity}) async {
    var box = db.getBox('taskBox');
    if (taskEntity.task.isNotEmpty) {
      Map<String, dynamic> taskItem = {
        "task": taskEntity.task,
        "statusTask": taskEntity.statusTask,
      };
    
      box.add(taskItem);

      return const Right(true);
    } else {
      return Left(Exception('Error when try to save the task'));
    }
  }
}
