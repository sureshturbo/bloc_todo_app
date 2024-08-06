import '../../domain/entities/task.dart';

class TaskRepository{

  final List<Task> _task = [];

  List<Task> getTask() => List.unmodifiable(_task);

  void addTask(Task task){
    _task.add(task);
  }

  void deleteTask(Task task){
    _task.remove(task);
  }

  void markTaskCompleted(Task task){
    final index = _task.indexOf(task);
    if(index != -1){
      _task[index] = task.copywith(iscompleted: true);
    }

  }
  //
  List<Task> filterTasks(TaskFilter filter){
        switch(filter){
          case TaskFilter.all:
            return getTask();
          case TaskFilter.completed:
            return _task.where((task) => task.iscompleted).toList();
          case TaskFilter.pending:
            return _task.where((task) => task.iscompleted).toList();
        }
  }

}