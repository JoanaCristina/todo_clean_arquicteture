import 'package:dartz/dartz.dart';
import 'package:todo_list_clean_arch/src/data/datasources/delete_task_datasource.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';
import 'package:todo_list_clean_arch/src/domain/repositories/delete_task_repository.dart';

class DeleteTaskRepositoryImp implements DeleteTaskRepository {
  final DeleteTaskDatasource _datasource;

  DeleteTaskRepositoryImp(this._datasource);

  @override
  Future<Either<Exception, bool>> deleteTask(
      {required TaskEntity taskEntity}) async {
     
     return await _datasource(taskEntity);
      
    
  }
}
