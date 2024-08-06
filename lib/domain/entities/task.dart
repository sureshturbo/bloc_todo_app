import 'package:equatable/equatable.dart';

class Task extends Equatable{
  final String id;
  final String title;
  final bool iscompleted;

  Task({required this.iscompleted,required this.title,required this.id,});

  @override
  // TODO: implement props
  List<Object?> get props => [id,title,iscompleted];

  Task copywith({String? id, String? title, bool? iscompleted}){
      return Task(
          iscompleted: iscompleted?? this.iscompleted,
          title : title ?? this.title,
          id: id ?? this.id);
  }

}

enum TaskFilter {all, completed, pending}