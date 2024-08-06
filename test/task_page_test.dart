


import 'package:bloc_todo_app/data/repositories/task_respository.dart';
import 'package:bloc_todo_app/domain/usecases/add_task.dart';
import 'package:bloc_todo_app/domain/usecases/delete_task.dart';
import 'package:bloc_todo_app/domain/usecases/filter_task.dart';
import 'package:bloc_todo_app/domain/usecases/get_task.dart';
import 'package:bloc_todo_app/domain/usecases/mark_task_completed.dart';
import 'package:bloc_todo_app/presentation/bloc/task_bloc.dart';
import 'package:bloc_todo_app/presentation/pages/task_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late TaskRepository repository;
  late TaskBloc taskBloc;

  setUp(() {
    repository = TaskRepository();
    taskBloc =
    TaskBloc(
        markTaskCompleted: MarkTaskCompleted(repository: repository),
        deleteTask: DeleteTask(repository),
        addTask: AddTask(repository),
        getTask: GetTask(repository: repository),
        filterTasks: FilterTasks(repository))..add(LoadTasks());
  });

  testWidgets('should display tasks on the task page', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => taskBloc,
          ),
        ],
        child: MaterialApp(
          home: Taskpage(),
        ),
      ),
    );

    expect(find.text('To-Do List'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('should add a task', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => taskBloc,
          ),
        ],
        child: MaterialApp(
          home: Taskpage(),
        ),
      ),
    );

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'New Task');
    await tester.tap(find.text('Add'));
    await tester.pump();

    expect(find.text('New Task'), findsOneWidget);
  });
}
