

import 'package:bloc_todo_app/data/repositories/task_respository.dart';
import 'package:bloc_todo_app/domain/entities/task.dart';
import 'package:bloc_todo_app/domain/usecases/add_task.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late TaskRepository repository;
  late AddTask addTask;

  setUp(() {
    repository = TaskRepository();
    addTask = AddTask(repository);
  });

  test('should add task to repository', () {
    final task = Task(id: '1', title: 'Test Task', iscompleted: false);

    addTask.execute(task);

    expect(repository.getTask(), contains(task));
  });
}

