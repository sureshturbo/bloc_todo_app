import 'package:bloc_todo_app/data/repositories/task_respository.dart';

import '../entities/task.dart';

class DeleteTask{
  final TaskRepository repository;

  DeleteTask(this.repository);

  void execute(Task task){
    repository.deleteTask(task);
  }
}