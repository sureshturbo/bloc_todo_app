import 'package:bloc_todo_app/data/repositories/task_respository.dart';
import 'package:bloc_todo_app/domain/entities/task.dart';
import 'package:bloc_todo_app/domain/usecases/delete_task.dart';
import 'package:flutter_test/flutter_test.dart';




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