import 'package:dartz/dartz.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';
import 'package:todo_list_clean_arch/src/domain/repositories/delete_task_repository.dart';
import 'package:todo_list_clean_arch/src/domain/usecases/delete_task_usecase/delete_task_usecase.dart';

class DeleteTaskUsecaseImp implements DeleteTaskUsecase {
  final DeleteTaskRepository repository;

  DeleteTaskUsecaseImp({required this.repository});

  @override
  Future<Either<Exception,bool>> call({required TaskEntity taskEntity}) async {
    return await repository.deleteTask(taskEntity: taskEntity);
  }
}
