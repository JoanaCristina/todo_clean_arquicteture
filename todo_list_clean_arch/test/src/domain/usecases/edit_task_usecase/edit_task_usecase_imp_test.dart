import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list_clean_arch/src/data/datasources/local/edit_task_local_datasource_imp.dart';
import 'package:todo_list_clean_arch/src/data/repositories/edit_task_repository_imp.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';
import 'package:todo_list_clean_arch/src/domain/usecases/edit_task_usecase/edit_task_usecase_imp.dart';

void main() {
  var _datasource = EditTaskLocalDatasourceImp();
  var _repository = EditTaskRepositoryImp(_datasource);
  EditTaskUsecaseImp usecase = EditTaskUsecaseImp(repository: _repository);

  testWidgets('Should edit a task', (tester) async {
    var task1 = TaskEntity(task: 'editada', statusTask: false);
    var answer = await usecase(taskEntity: task1);
    late bool result;
    answer.fold((l) => l, (r) => result = r);
    expect(result, true);
  });

  testWidgets('Should not edit a task', (tester) async {
    var task2 = TaskEntity(task: 'ediitada', statusTask: false);
    var answer = await usecase(taskEntity: task2);
    late Exception result;
    answer.fold((l) => result = l, (r) => r);
    expect(result, isException);
  });
}
