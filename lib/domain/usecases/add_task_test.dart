// test/domain/usecases/add_task_test.dart
import 'package:flutter_test/flutter_test.dart';

import '../../data/repositories/task_respository.dart';
import '../entities/task.dart';
import 'add_task.dart';


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

