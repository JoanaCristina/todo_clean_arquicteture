import 'package:dartz/dartz.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';

abstract class DeleteTaskUsecase {
  Future<Either<Exception,bool>> call({required TaskEntity taskEntity});
}
