import 'package:bloc_todo_app/data/repositories/task_respository.dart';

import '../entities/task.dart';

class GetTask{
      final TaskRepository repository;

      GetTask({required this.repository});

      List<Task> execute(){
            return repository.getTask();
      }
}