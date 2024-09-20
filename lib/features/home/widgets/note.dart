import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localdata_app/features/home/widgets/todo_card.dart';
import 'package:provider/provider.dart';

import '../../../core/provider_task.dart';

class Note extends StatelessWidget{
  const Note({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    if (taskProvider.tasks.isEmpty) {
      return const Center(
        child:Scaffold(
          backgroundColor: Color(0xFF180e2b),
          body:Text("Welcome, add your task",style: TextStyle(color: Colors.white,fontSize: 20),),)
      );
    }
    return Column(
        children: [
          ListView.builder(
                itemCount: taskProvider.tasks.length,
                itemBuilder:(context,index){
                  return TodoCard(
                    title: taskProvider.tasks[index]['title'] ?? '',
                    time: taskProvider.tasks[index]['time'] ?? '',
                    dis: taskProvider.tasks[index]['dis'] ?? '',
                    date: taskProvider.tasks[index]['date'] ?? '',
                    onDelete: ()=> taskProvider.deleteTask(taskProvider.tasks[index]['id']),);
                } ),
                  ],
                );
  }

}