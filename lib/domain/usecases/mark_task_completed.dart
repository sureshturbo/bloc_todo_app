import 'package:bloc_todo_app/data/repositories/task_respository.dart';

import '../entities/task.dart';

class MarkTaskCompleted{
      final TaskRepository repository;
      MarkTaskCompleted({required this.repository});

      void execute(Task task){
        repository.markTaskCompleted(task);
      }

}