import 'package:bloc_todo_app/data/repositories/task_respository.dart';

import '../entities/task.dart';

class FilterTasks{
  final TaskRepository repository;

  FilterTasks(this.repository);

  List<Task> execute(TaskFilter filter){
    return repository.filterTasks(filter);

  }

}