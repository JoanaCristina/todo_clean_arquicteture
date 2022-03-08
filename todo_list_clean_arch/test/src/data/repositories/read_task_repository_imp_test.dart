import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list_clean_arch/src/core/local_db/hive.dart';
import 'package:todo_list_clean_arch/src/data/datasources/local/read_task_local_datasource_imp.dart';
import 'package:todo_list_clean_arch/src/data/repositories/read_task_repository_imp.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';

void main() {
  var _hiveDb = HiveDb();
  var _datasource = ReadTaskLocalDatasourceImp(db: _hiveDb);
  var repository = ReadTaskRepositotyImp(_datasource);

  testWidgets('read task repository imp ...', (tester) async {
    var answer = await repository();
    late List<TaskEntity> result;
    answer.fold((l) => l, (r) => result = r);

    expect(result, isNotNull);
  });
}
