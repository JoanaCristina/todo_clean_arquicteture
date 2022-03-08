import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list_clean_arch/src/core/local_db/hive.dart';
import 'package:todo_list_clean_arch/src/data/datasources/local/save_task_local_datasource_imp.dart';
import 'package:todo_list_clean_arch/src/data/repositories/save_task_repository_imp.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';
import 'package:todo_list_clean_arch/src/domain/usecases/save_task_usecase/save_task_usecase_imp.dart';

void main() {
  var _db = HiveDb();
  var _datasource = SaveTaskLocalDatasourceImp(db:_db);
  var _repository = SaveTaskRepositoryImp(_datasource);
  var usecase = SaveTaskUsecaseImp(repository: _repository);
  testWidgets('Should save a task', (tester) async {
    var task1 = TaskEntity(task: 'Pintar o cabelo', statusTask:false);
    var answer = await usecase(taskEntity: task1);
    late bool result;
    answer.fold((l) => l, (r) => result = r);
    expect(result, true);
  });

  testWidgets('Should not save a task', (tester) async {
    var task2 = TaskEntity(task: '', statusTask: false);
    var answer = await usecase(taskEntity: task2);
    late Exception result;
    answer.fold((l) => result = l, (r) => r);
    expect(result, isException);
  });
}
