import 'package:bloc_todo_app/data/repositories/task_respository.dart';

import '../entities/task.dart';

class AddTask{
  final TaskRepository repository;

  AddTask(this.repository);

  void execute(Task task){
    repository.addTask(task);
  }
}