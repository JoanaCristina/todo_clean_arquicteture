import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list_clean_arch/src/domain/entities/task_entity.dart';

void main() {
  TaskEntity task;
  testWidgets('Should return a UpperCase text', (tester) async {
    task = TaskEntity(task: "Testing my Entity class", statusTask: true);
    String result = task.toUpperCase(task: task.task);

    expect(result, 'TESTING MY ENTITY CLASS');
  });
}
