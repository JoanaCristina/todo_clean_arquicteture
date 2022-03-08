import 'package:get_it/get_it.dart';
import 'package:todo_list_clean_arch/src/core/local_db/hive.dart';
import 'package:todo_list_clean_arch/src/data/datasources/delete_task_datasource.dart';
import 'package:todo_list_clean_arch/src/data/datasources/edit_task_datasource.dart';
import 'package:todo_list_clean_arch/src/data/datasources/local/delete_task_local_datasource_imp.dart';
import 'package:todo_list_clean_arch/src/data/datasources/local/edit_task_local_datasource_imp.dart';
import 'package:todo_list_clean_arch/src/data/datasources/local/read_task_local_datasource_imp.dart';
import 'package:todo_list_clean_arch/src/data/datasources/local/save_task_local_datasource_imp.dart';
import 'package:todo_list_clean_arch/src/data/datasources/read_task_datasource.dart';
import 'package:todo_list_clean_arch/src/data/datasources/save_task_datasource.dart';
import 'package:todo_list_clean_arch/src/data/repositories/delete_task_repository_imp.dart';
import 'package:todo_list_clean_arch/src/data/repositories/edit_task_repository_imp.dart';
import 'package:todo_list_clean_arch/src/data/repositories/read_task_repository_imp.dart';
import 'package:todo_list_clean_arch/src/data/repositories/save_task_repository_imp.dart';
import 'package:todo_list_clean_arch/src/domain/repositories/delete_task_repository.dart';
import 'package:todo_list_clean_arch/src/domain/repositories/edit_task_repository.dart';
import 'package:todo_list_clean_arch/src/domain/repositories/read_task_repository.dart';
import 'package:todo_list_clean_arch/src/domain/repositories/save_task_repository.dart';
import 'package:todo_list_clean_arch/src/domain/usecases/delete_task_usecase/delete_task_usecase.dart';
import 'package:todo_list_clean_arch/src/domain/usecases/delete_task_usecase/delete_task_usecase_imp.dart';
import 'package:todo_list_clean_arch/src/domain/usecases/edit_task_usecase/edit_task_usecase.dart';
import 'package:todo_list_clean_arch/src/domain/usecases/edit_task_usecase/edit_task_usecase_imp.dart';
import 'package:todo_list_clean_arch/src/domain/usecases/read_task_usecase/read_task_usecase.dart';
import 'package:todo_list_clean_arch/src/domain/usecases/read_task_usecase/read_task_usecase_imp.dart';
import 'package:todo_list_clean_arch/src/domain/usecases/save_task_usecase/save_task_usecase.dart';
import 'package:todo_list_clean_arch/src/domain/usecases/save_task_usecase/save_task_usecase_imp.dart';
import 'package:todo_list_clean_arch/src/presentation/controllers/task_controller.dart';

class Inject {
  //CONTAINER DE INJEÇÃO DE DEPENDÊNCIA
  static void init() {
    GetIt getIt = GetIt.instance;

      
    //Começamos a registrar do mais interno para fora
    //datasources. Tipa-se utilizando a Interface
    //******************DATASOURCES************************
    getIt.registerLazySingleton<SaveTaskDatasource>(
        () => SaveTaskLocalDatasourceImp(db: HiveDb()));
    getIt.registerLazySingleton<ReadTaskDatasource>(
        () => ReadTaskLocalDatasourceImp(db:HiveDb()));
    getIt.registerLazySingleton<EditTaskDatasource>(
        () => EditTaskLocalDatasourceImp());
    getIt.registerLazySingleton<DeleteTaskDatasource>(
        () => DeleteTaskLocalDatasourceImp());

    //*********REPOSITORIES*******************************
    getIt.registerLazySingleton<SaveTaskRepository>(
        () => SaveTaskRepositoryImp(getIt()));
    getIt.registerLazySingleton<ReadTaskRepository>(
        () => ReadTaskRepositotyImp(getIt()));
    getIt.registerLazySingleton<EditTaskRepository>(
        () => EditTaskRepositoryImp(getIt()));
    getIt.registerLazySingleton<DeleteTaskRepository>(
        () => DeleteTaskRepositoryImp(getIt()));
    //**************USECASES********************************
    getIt.registerLazySingleton<SaveTaskUsecase>(
        () => SaveTaskUsecaseImp(repository: getIt()));
    getIt.registerLazySingleton<ReadTaskUsecase>(
        () => ReadTaskUsecaseImp(repository: getIt()));
    getIt.registerLazySingleton<EditTaskUsecase>(
        () => EditTaskUsecaseImp(repository: getIt()));
    getIt.registerLazySingleton<DeleteTaskUsecase>(
        () => DeleteTaskUsecaseImp(repository: getIt()));

    //***************CONTROLLERS******************************
    //TIPO FACTORY:Toda vez que a classe for recuperada será criado uma nova instância
    getIt.registerFactory<TaskController>(
        () => TaskController(getIt(), getIt(), getIt(), getIt()));
  }
}
