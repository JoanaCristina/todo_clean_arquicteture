import 'package:dartz/dartz.dart';
import 'package:todo_list_clean_arch/src/data/datasources/edit_task_datasource.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';
import 'package:todo_list_clean_arch/src/domain/repositories/edit_task_repository.dart';

class EditTaskRepositoryImp implements EditTaskRepository {
  final EditTaskDatasource _datasource;
  EditTaskRepositoryImp(this._datasource);

  @override
  Future<Either<Exception, bool>> editTask(
      {required TaskEntity taskEntity}) async {
      return await _datasource(taskEntity);
      
    
  }
}
