import 'package:flutter_test/flutter_test.dart';

import '../../data/repositories/task_respository.dart';
import '../entities/task.dart';
import 'delete_task.dart';


void main() {
  late TaskRepository repository;
  late DeleteTask deleteTask;

  setUp(() {
    repository = TaskRepository();
    deleteTask = DeleteTask(repository);
  });

  test('should delete task from repository', () {
    final task = Task(id: '1', title: 'Test Task', iscompleted: false);
    repository.addTask(task);

    deleteTask.execute(task);

    expect(repository.getTask(), isNot(contains(task)));
  });
}