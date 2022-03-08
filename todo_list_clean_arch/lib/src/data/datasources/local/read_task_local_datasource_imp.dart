import 'package:dartz/dartz.dart';
import 'package:todo_list_clean_arch/src/core/local_db/hive.dart';
import 'package:todo_list_clean_arch/src/data/dto/task_dto.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';
import '../read_task_datasource.dart';

class ReadTaskLocalDatasourceImp implements ReadTaskDatasource {
//aqui colocamos a forma de persistir os dados desejados: sqlite, shared, firebase, etc.

  late final HiveDb db;
  ReadTaskLocalDatasourceImp({required this.db});

  /*var json = [
    {'id': 1, 'task': 'Programar mobile', 'statusTask': true},
    {'id': 2, 'task': 'Programar desktop', 'statusTask': false},
    {'id': 3, 'task': 'Programar web', 'statusTask': true},
  ];*/

  @override
  Future<Either<Exception, List<TaskEntity>>> call() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      var box = db.getBox('taskBox');
      final data = box.keys.map((key) {
        var taskItem = box.get(key);
        var result = {
          'id': key,
          'task': taskItem['task'],
          'statusTask': taskItem['statusTask']
        };
        return TaskDto.fromMap(result);
      }).toList();

      return Right(data);
    } catch (e) {
      return Left(Exception("Error when try to read the tasks"));
    }
  }
}
