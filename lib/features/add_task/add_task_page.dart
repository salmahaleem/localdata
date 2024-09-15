import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constant.dart';

class AddTaskPage extends StatefulWidget{
   AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF180e2b),
      appBar: AppBar(
        backgroundColor: Color(0xFF180e2b),
        leadingWidth: 100,
        leading:Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text("TO DO" ,style: TextStyle(color: Colors.white,fontSize: 21,fontWeight: FontWeight.bold)),
        ),
        actions: [
          Icon(Icons.notification_add_rounded,color: Colors.white,),
          SizedBox(width: 10,),
          Icon(Icons.more_vert_outlined,color: Colors.white,),
        ],
      ),
     body:  Form(
       key: formKey,
       child: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(15.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Add your Task" ,style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold)),
               SizedBox(height: 30,),
               TextFormField(
                 validator: (value){
                   if(value!.isEmpty || value == null){
                     return 'please enter a title';
                   }
                   return null;
                 },
                  decoration:
                  InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFccc2fe),
                      hintText: "Title",
                      hintStyle: TextStyle(color: Color(0xFF180e2b)),
                      suffixIcon: Icon(Icons.task,color: Color(0xFF180e2b)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFccc2fe),),
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                 keyboardType: TextInputType.text,
                 controller: titleController,
                ),
               SizedBox(height: 20,),
               TextFormField(
                 validator: (value){
                   if(value!.isEmpty || value == null){
                     return 'please enter a description';
                   }
                   return null;
                 },
                 decoration:
                 InputDecoration(
                     filled: true,
                     fillColor: Color(0xFFccc2fe),
                     hintText: "Description",
                     hintStyle: TextStyle(color: Color(0xFF180e2b)),
                     suffixIcon: Icon(Icons.description,color: Color(0xFF180e2b),),
                     border: OutlineInputBorder(
                       borderSide: BorderSide(color: Color(0xFFccc2fe),),
                       borderRadius: BorderRadius.circular(20),
                     )
                 ),
                 keyboardType: TextInputType.text,
                 controller: disController,
               ),
               SizedBox(height: 20,),
               TextFormField(
                 validator: (value){
                   if(value!.isEmpty || value == null){
                     return 'please enter a time';
                   }
                   return null;
                 },
                 decoration:
                 InputDecoration(
                     filled: true,
                     fillColor: Color(0xFFccc2fe),
                     hintText: "Time",
                     hintStyle: TextStyle(color: Color(0xFF180e2b)),
                     suffixIcon: Icon(Icons.timer,color: Color(0xFF180e2b)),
                     border: OutlineInputBorder(
                       borderSide: BorderSide(color: Color(0xFFccc2fe),),
                       borderRadius: BorderRadius.circular(20),
                     )
                 ),
                 keyboardType: TextInputType.text,
                 controller: timeController,
                 onTap: (){
                   showTimePicker(context: context,
                       initialTime: TimeOfDay.now()).then((value){
                       timeController.text=value!.format(context).toString();
                       }
                   );
                 },
               ),
               SizedBox(height: 20,),
               TextFormField(
                 validator: (value){
                   if(value!.isEmpty || value == null){
                     return 'please enter a date';
                   }
                   return null;
                 },
                 decoration:
                 InputDecoration(
                     filled: true,
                     fillColor: Color(0xFFccc2fe),
                     hintText: "Date",
                     hintStyle: TextStyle(color: Color(0xFF180e2b)),
                     suffixIcon: Icon(Icons.calendar_month,color: Color(0xFF180e2b)),
                     border: OutlineInputBorder(
                       borderSide: BorderSide(color: Color(0xFFccc2fe),),
                       borderRadius: BorderRadius.circular(20),
                     )
                 ),
                 controller: dateController,
                 keyboardType: TextInputType.text,
                 onTap: (){
                   showDatePicker(context: context,
                       firstDate:DateTime.now(),
                       lastDate:DateTime(2030),
                   ).then((value){
                     dateController.text = DateFormat.yMMMd().format(value!);
                   });
                 },
               ),
               SizedBox(height: 200,),
               Container(
                 width: double.infinity,
                 child: ElevatedButton(onPressed: (){
                   setState(() {
                     if(formKey.currentState!.validate()){
                       Navigator.pop(context,{
                         "title": titleController.text,
                         "dis":  disController.text,
                         "time": timeController.text,
                         "date": dateController.text,
                       });
                       print("done");
                     }
                   });
                 }, child: Text("ADD",style: TextStyle(fontSize: 25,color: Color(0xFF281155),fontWeight: FontWeight.bold))),
               )
             ],
           ),
         ),
       ),
     ),
    );
  }
}