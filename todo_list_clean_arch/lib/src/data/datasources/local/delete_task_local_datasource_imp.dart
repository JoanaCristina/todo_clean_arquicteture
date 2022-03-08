
import 'package:dartz/dartz.dart';
import 'package:todo_list_clean_arch/src/data/datasources/delete_task_datasource.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';

class DeleteTaskLocalDatasourceImp implements DeleteTaskDatasource {
  @override
  Future<Either<Exception, bool>> call(TaskEntity taskEntity) async {
    return taskEntity.task =="Olá" 
    ? const Right(true) 
    : Left(Exception("Error when try to delete the task"));
  }
}
