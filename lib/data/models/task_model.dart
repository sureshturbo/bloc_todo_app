import 'package:equatable/equatable.dart';

class Taskmodel extends Equatable {
  final String id;
  final String title;
  final bool iscompleted;

  Taskmodel({required this.id,required this.title,this.iscompleted = false});

  @override
  // TODO: implement props
  List<Object?> get props => [id,title,iscompleted];

  Taskmodel copywith({String? id,String? title,bool? iscompleted}){
    return Taskmodel(id: id ?? this.id, title:title?? this.title,iscompleted:iscompleted ?? this.iscompleted);
  }

}