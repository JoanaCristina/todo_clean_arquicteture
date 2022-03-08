import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list_clean_arch/src/data/datasources/local/delete_task_local_datasource_imp.dart';
import 'package:todo_list_clean_arch/src/data/repositories/delete_task_repository_imp.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';
import 'package:todo_list_clean_arch/src/domain/usecases/delete_task_usecase/delete_task_usecase_imp.dart';

void main() {
  var _datasource = DeleteTaskLocalDatasourceImp();
  var _repository = DeleteTaskRepositoryImp(_datasource);
  var usecase = DeleteTaskUsecaseImp(repository: _repository);
  testWidgets('Should delete a task', (tester) async {
    var task1 = TaskEntity(task: 'task', statusTask: false);
    var answer = await usecase(taskEntity: task1);
    late bool result;
    answer.fold((l) => l, (r) => result = r);
    expect(result, true);
  });

  testWidgets('Should not delete a task', (tester) async {
    var task2 = TaskEntity(task: 'task', statusTask: false);
    var answer = await usecase(taskEntity: task2);
    late Exception result;
    answer.fold((l) =>result = l, (r) => r);
    expect(result, isException);
  });
}
