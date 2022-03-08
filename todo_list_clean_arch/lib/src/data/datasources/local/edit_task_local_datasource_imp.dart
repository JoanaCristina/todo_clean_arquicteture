
import 'package:dartz/dartz.dart';
import 'package:todo_list_clean_arch/src/data/datasources/edit_task_datasource.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';

class EditTaskLocalDatasourceImp implements EditTaskDatasource {
  @override
  Future<Either<Exception,bool>> call(TaskEntity taskEntity) async {
    return taskEntity.task == "editada" 
    ? const Right(true) 
    : Left(Exception("Error when try to edit tha task"));
  }
}
