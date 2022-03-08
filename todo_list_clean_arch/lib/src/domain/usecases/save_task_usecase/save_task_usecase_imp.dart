import 'package:dartz/dartz.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';
import 'package:todo_list_clean_arch/src/domain/repositories/save_task_repository.dart';
import 'package:todo_list_clean_arch/src/domain/usecases/save_task_usecase/save_task_usecase.dart';

class SaveTaskUsecaseImp implements SaveTaskUsecase {
  final SaveTaskRepository repository;

  SaveTaskUsecaseImp({required this.repository});

  @override
  Future<Either<Exception,bool>> call({required TaskEntity taskEntity}) async {
    return await repository(taskEntity:taskEntity);
  }
}
