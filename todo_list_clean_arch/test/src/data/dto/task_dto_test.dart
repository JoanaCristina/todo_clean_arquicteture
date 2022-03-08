import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list_clean_arch/src/data/dto/task_dto.dart';

void main() {
  var json = {
    'id': 1,
    'statusTask': true,
    'task': 'Terminar a leitura do Clean Arch'
  };

  testWidgets('Should return a Map', (tester) async{
    var taskDto = TaskDto(
        newTask: 'Terminar a leitura do Clean Arch', newStatusTask: true, newId: 1);
    var result = taskDto.toMap();
    expect(result, json);
  });

  testWidgets('Should return a TaskDto object', (tester) async {
    var taskDto1 = TaskDto(newTask: 'Terminar a leitura do Clean Arch', newStatusTask: true, newId: 1);
    var result =  TaskDto.fromMap(json);
    expect(result, isNotNull);
  });
}
