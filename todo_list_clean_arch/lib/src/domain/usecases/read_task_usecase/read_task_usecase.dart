import 'package:dartz/dartz.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';

abstract class ReadTaskUsecase {
  Future<Either<Exception,List<TaskEntity>>> call();
}
