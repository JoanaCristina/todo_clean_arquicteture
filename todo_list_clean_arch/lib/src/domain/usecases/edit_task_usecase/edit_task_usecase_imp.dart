import 'package:dartz/dartz.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';
import 'package:todo_list_clean_arch/src/domain/repositories/edit_task_repository.dart';
import 'package:todo_list_clean_arch/src/domain/usecases/edit_task_usecase/edit_task_usecase.dart';

class EditTaskUsecaseImp implements EditTaskUsecase {
  final EditTaskRepository repository;

  EditTaskUsecaseImp({required this.repository});
  @override
  Future<Either<Exception,bool>> call({required TaskEntity taskEntity}) async {
    return await repository.editTask(taskEntity: taskEntity);
  }
}
