class TaskEntity {
   String task;
    bool statusTask;
  //late final int id;

  TaskEntity({required this.task, required this.statusTask});

//pode conter métodos que dependem única e exclusivamente da sua regra de negócio cooporativa
  String toUpperCase({required String task}) {
    return task.toUpperCase();
  }
}
