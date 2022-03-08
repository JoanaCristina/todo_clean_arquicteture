import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list_clean_arch/src/core/local_db/hive.dart';
import 'package:todo_list_clean_arch/src/data/datasources/local/save_task_local_datasource_imp.dart';
import 'package:todo_list_clean_arch/src/data/repositories/save_task_repository_imp.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';

void main() {
  var _db = HiveDb();
  var _datasource = SaveTaskLocalDatasourceImp(db:_db);
  var repository = SaveTaskRepositoryImp(_datasource);

  testWidgets('Should save a task ', (tester) async {
    var task1 = TaskEntity( statusTask: true, task: 'Programar');
    var answer = await repository(taskEntity: task1);
    late bool result;
    answer.fold((l) => l, (r) => result = r);
    expect(result, true);
  });
}
