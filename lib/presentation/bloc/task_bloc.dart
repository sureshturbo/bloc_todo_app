import 'package:bloc_todo_app/domain/usecases/add_task.dart';
import 'package:bloc_todo_app/domain/usecases/delete_task.dart';

import 'package:bloc_todo_app/domain/usecases/delete_task.dart';
import 'package:bloc_todo_app/domain/usecases/get_task.dart';
import 'package:bloc_todo_app/domain/usecases/mark_task_completed.dart';
import 'package:bloc_todo_app/domain/usecases/mark_task_completed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/task.dart';
import '../../domain/usecases/filter_task.dart';

abstract class TaskEvent{}

class LoadTasks extends TaskEvent{

}


class AddTaskEvent extends TaskEvent {
  final Task task;
  AddTaskEvent(this.task);

}


class DeleteTaskEvent extends TaskEvent {
  final Task task;
  DeleteTaskEvent(this.task);
}


class MarkTaskCompletedEvent extends TaskEvent {
  final Task task;
  MarkTaskCompletedEvent(this.task);

}

class FilterTasksEvent extends TaskEvent{
  final TaskFilter filter;

  FilterTasksEvent(this.filter);
}


abstract class TaskState{}

class TaskInitial extends TaskState{}

class TaskLoading extends TaskState{}

class Taskloaded extends TaskState{
  final List<Task> tasks;
  Taskloaded(this.tasks);
}

class TaskError extends TaskState{
  final String message;
  TaskError({required this.message});
}


class TaskBloc extends Bloc<TaskEvent, TaskState>{

  final GetTask getTask;
  final AddTask addTask;
  final DeleteTask deleteTask;
  final MarkTaskCompleted markTaskCompleted;
  final FilterTasks filterTasks;

  TaskBloc(
      {required this.markTaskCompleted,required this.deleteTask,
        required this.addTask,required this.getTask,required this.filterTasks}
      ): super(TaskInitial()){
    on<LoadTasks>((event, emit){
      emit(TaskLoading());
      try{
        final tasks = getTask.execute();
        emit(Taskloaded(tasks));
      } catch (e){
        emit(TaskError(message: e.toString()));
      }
    });

    on<AddTaskEvent>((event,emit){
      addTask.execute(event.task);
      add(LoadTasks());
    });

    on<DeleteTaskEvent>((event, emit){
      deleteTask.execute(event.task);
      add(LoadTasks());
    });

    on<MarkTaskCompletedEvent>((event, emit){
      markTaskCompleted.execute(event.task);
      add(LoadTasks());
    });

    on<FilterTasksEvent>((event,emit){
        emit(TaskLoading());
        try{
          final tasks = filterTasks.execute(event.filter);
          emit(Taskloaded(tasks));
        }catch(e){
          emit(TaskError(message: e.toString()));
        }
    });


  }


}