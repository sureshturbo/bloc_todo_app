import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/task.dart';
import '../bloc/task_bloc.dart';

class Task_item extends StatelessWidget {
  final Task task;
   Task_item({Key? key,required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title,style: TextStyle(decoration: task.iscompleted? TextDecoration.lineThrough : TextDecoration.none),),
      leading: Checkbox(value: task.iscompleted, onChanged: (value){
          context.read<TaskBloc>().add(MarkTaskCompletedEvent(task));
      }),
      trailing: IconButton(onPressed: (){
        context.read<TaskBloc>().add(DeleteTaskEvent(task));
      }, icon: Icon(Icons.delete)),
    );
  }
}
