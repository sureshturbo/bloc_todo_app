

import 'package:bloc_todo_app/domain/entities/task.dart';
import 'package:bloc_todo_app/presentation/bloc/task_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/task_list.dart';

class Taskpage extends StatelessWidget {
  const Taskpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
        actions: [
          PopupMenuButton<TaskFilter>(
            onSelected: (filter){
              context.read<TaskBloc>().add(FilterTasksEvent(filter));
            },
              itemBuilder: (context)=>[
          PopupMenuItem(value: TaskFilter.all,child: Text('All')),
          PopupMenuItem(value: TaskFilter.completed,child: Text('Completed')),
          PopupMenuItem(value: TaskFilter.pending,child: Text('Pending')),
        ])
        ],
      ),
      body: BlocBuilder<TaskBloc, TaskState>(builder: (context,state){
            if(state is TaskLoading){
              return Center(child: CircularProgressIndicator());
            }
            else if(state is Taskloaded){
              return TaskList(tasks: state.tasks);
            }else if(state is TaskError){
              return Center(child: Text(state.message),);
            }
            return Center(child: Text('No Tasks'),);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> _showAddTaskDialog(context),
        child:Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context){
    final TextEditingController controller = TextEditingController();
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Add Task'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: 'Task title')  ,
        ),
        actions: [
          TextButton(onPressed: (){
            if(controller.text.isNotEmpty){
              final task = Task(title: controller.text, id: DateTime.now().toString(), iscompleted: false);
              context.read<TaskBloc>().add(AddTaskEvent(task));
            }
            Navigator.of(context).pop();
          }, child: Text('Add'))
        ],
      );
    });

  }
}
