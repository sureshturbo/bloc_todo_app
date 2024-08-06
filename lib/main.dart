import 'package:bloc_todo_app/domain/usecases/add_task.dart';
import 'package:bloc_todo_app/domain/usecases/filter_task.dart';
import 'package:bloc_todo_app/domain/usecases/get_task.dart';
import 'package:bloc_todo_app/presentation/bloc/task_bloc.dart';
import 'package:bloc_todo_app/presentation/pages/task_page.dart';
import 'package:bloc_todo_app/presentation/widgets/task_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/task_respository.dart';
import 'domain/usecases/delete_task.dart';
import 'domain/usecases/mark_task_completed.dart';

void main() {
  final taskRepository = TaskRepository();
  runApp(MyApp(taskRepository: taskRepository));
}

class MyApp extends StatelessWidget {
  final TaskRepository taskRepository;
  MyApp({Key? key,required this.taskRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
              TaskBloc(
              markTaskCompleted: MarkTaskCompleted(repository: taskRepository),
              deleteTask: DeleteTask(taskRepository),
              addTask: AddTask(taskRepository),
              getTask: GetTask(repository: taskRepository),
                  filterTasks: FilterTasks(taskRepository))..add(LoadTasks())
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'to-do list',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: Taskpage()
        ));
  }
}



