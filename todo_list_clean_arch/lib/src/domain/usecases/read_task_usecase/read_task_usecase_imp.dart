import 'package:dartz/dartz.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';
import 'package:todo_list_clean_arch/src/domain/repositories/read_task_repository.dart';
import 'package:todo_list_clean_arch/src/domain/usecases/read_task_usecase/read_task_usecase.dart';

class ReadTaskUsecaseImp implements ReadTaskUsecase {
  final ReadTaskRepository repository;
  
  ReadTaskUsecaseImp({required this.repository});

  @override
   Future<Either<Exception,List<TaskEntity>>> call() async {
    return await repository();
  }
}
