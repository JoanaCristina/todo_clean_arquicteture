import 'package:dartz/dartz.dart';
import 'package:todo_list_clean_arch/src/data/datasources/save_task_datasource.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';
import 'package:todo_list_clean_arch/src/domain/repositories/save_task_repository.dart';

class SaveTaskRepositoryImp implements SaveTaskRepository {
  final SaveTaskDatasource _datasource;

  SaveTaskRepositoryImp(this._datasource);

  @override
  Future<Either<Exception, bool>> call({required TaskEntity taskEntity}) async {
    return await _datasource(taskEntity: taskEntity);
  }
}
