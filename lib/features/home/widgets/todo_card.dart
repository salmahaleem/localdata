import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget{
  final String title;
  final String dis;
  final String time;
  final String date;
  final VoidCallback onDelete;

   TodoCard({super.key,required this.title,required this.dis,required this.time,required this.date,required this.onDelete});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       height: 200,
       width: double.maxFinite,
       decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
       color: Color(0xFF7e64ff),
       child: Column(
         children: [
           Text(title,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
           SizedBox(height: 10,),
           Text(dis,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
           SizedBox(height: 10,),
           Text(time,style: TextStyle(color: Colors.white,fontSize: 15),),
           SizedBox(height: 10,),
           Text(date,style: TextStyle(color: Colors.white,fontSize: 15),),
           SizedBox(height: 10,),
           IconButton(onPressed:onDelete,icon: Icon(Icons.delete,color: Color(0xFF180e2b),)),
         ],
       ),
     ),
   );
  }

}