
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list_clean_arch/src/core/local_db/hive.dart';
import 'package:todo_list_clean_arch/src/data/datasources/local/read_task_local_datasource_imp.dart';
import 'package:todo_list_clean_arch/src/data/datasources/read_task_datasource.dart';
import 'package:todo_list_clean_arch/src/data/dto/task_dto.dart';
import 'package:todo_list_clean_arch/src/data/repositories/read_task_repository_imp.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';
import 'package:todo_list_clean_arch/src/domain/usecases/read_task_usecase/read_task_usecase_imp.dart';

class MockReadTaskLocalDatasourceImp implements ReadTaskDatasource {
  List<TaskDto> taskList = [];

  @override
  Future<Either<Exception, List<TaskDto>>> call() async {
    return taskList.isNotEmpty ? Right(taskList) : Left(Exception('Deu ruim'));
  }
}

void main() {
  var hiveDb = HiveDb();
  var _datasource = ReadTaskLocalDatasourceImp(db:hiveDb);
  var _repository = ReadTaskRepositotyImp(_datasource);
  ReadTaskUsecaseImp usecase = ReadTaskUsecaseImp(repository: _repository);
  testWidgets('read the list of tasks', (tester) async {
    var answer = await usecase();
    late List<TaskEntity> result;
    answer.fold((l) => l, (r) => result = r);
    expect(result, isNotEmpty);
  });

  testWidgets('does not read the list of tasks', (tester) async {
    var _mockDatasource = MockReadTaskLocalDatasourceImp();
    var _repositoryTwo = ReadTaskRepositotyImp(_mockDatasource);
    ReadTaskUsecaseImp usecaseTwo =
        ReadTaskUsecaseImp(repository: _repositoryTwo);
    var answer = await usecaseTwo();
    late Exception result;
    answer.fold((l) => result = l, (r) => r);
    expect(result, isException);
  });
}
