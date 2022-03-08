import 'package:dartz/dartz.dart';
import 'package:todo_list_clean_arch/src/data/datasources/read_task_datasource.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';
import 'package:todo_list_clean_arch/src/domain/repositories/read_task_repository.dart';

class ReadTaskRepositotyImp implements ReadTaskRepository {
  final ReadTaskDatasource _datasource;

  ReadTaskRepositotyImp(this._datasource);

  @override
  Future<Either<Exception, List<TaskEntity>>> call() async {
      return await _datasource();
    
  }
}
