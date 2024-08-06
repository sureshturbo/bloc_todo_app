import 'package:bloc_todo_app/presentation/widgets/task_item.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/entities/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
   TaskList({Key? key,required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder:(context,index){
          return Task_item(task: tasks[index]);
    } );
  }
}
