import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localdata_app/features/home/widgets/todo_card.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../constant.dart';
import '../../core/local_data.dart';
import '../add_task/add_task_page.dart';

class HomePage extends StatefulWidget{
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _initializeDatabaseAndGetTasks();
  }

  Future<void> _initializeDatabaseAndGetTasks() async {
    await createDatabase();
    await getTask();
  }

  //2
  Future<void> getTask() async {
    tasks = await getDataBase();
    setState(() {});
  }

  Future<void> delteTask(int id) async {
    await UpdateStatus(id);
    await deleteDataBase(id);
    await getTask();
  }
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
      body:Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(3.0),
                  height: 40,
                  width: 300,
                  color: Color(0xFF3c1f7b),
                  child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Color(0xFF3c1f7b),
                      indicator: BoxDecoration(
                        color: Color(0xFF180e2b),
                      ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    tabs: [
                      Tab(child: Text("Schedule")),
                      Tab(child: Text("Note")),
                    ],),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 400,
                  width: double.maxFinite,
                  child: TabBarView(
                    children: [
                      SfDateRangePicker(

                         headerHeight:60,
                         toggleDaySelection:true,
                         todayHighlightColor: Color(0xFF7e64ff),
                         backgroundColor: Color(0xFF180e2b),
                         selectionColor: Color(0xFF7e64ff),
                          headerStyle:DateRangePickerHeaderStyle(textAlign: TextAlign.center,textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),backgroundColor:Color(0xFF180e2b) ),
                          monthViewSettings:DateRangePickerMonthViewSettings(
                              dayFormat:'EEE',
                              showTrailingAndLeadingDates:true,
                              viewHeaderStyle:DateRangePickerViewHeaderStyle(
                                textStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white)
                              ),
                          ),
                          monthCellStyle:DateRangePickerMonthCellStyle(
                              textStyle: TextStyle(color: Colors.white),
                              todayTextStyle:TextStyle(color: Colors.white),
                              trailingDatesTextStyle:TextStyle(color: Colors.grey),
                              leadingDatesTextStyle:TextStyle(color: Colors.grey),
                              weekendTextStyle:TextStyle(color: Colors.red),
                              specialDatesTextStyle:TextStyle(color: Color(0xFF180e2b),fontSize: 12),
                              specialDatesDecoration:ShapeDecoration(shape: CircleBorder(),color: Color(0xFF7e64ff)),
                          ),
                      ),
                      Container(
                        child:ListView.builder(
                            itemCount: tasks.length,
                            itemBuilder:(context,index){
                              return TodoCard(title: tasks[index]['title'] ?? '',
                                time: tasks[index]['time'] ?? '',
                                dis: tasks[index]['dis'] ?? '',
                                date: tasks[index]['date'] ?? '',
                                onDelete: ()=> deleteDataBase(tasks[index]['id']),);
                            } ),
                        // child: Column(
                        //     children: [
                        //       TextFormField(
                        //         decoration:
                        //         InputDecoration(
                        //            filled: true,
                        //            fillColor: Color(0xFFccc2fe),
                        //            hintText: "Search note",
                        //            hintStyle: TextStyle(color: Colors.grey),
                        //            prefixIcon: Icon(Icons.search,color: Colors.grey,),
                        //            border: OutlineInputBorder(
                        //             borderSide: BorderSide(color: Color(0xFFccc2fe),),
                        //              borderRadius: BorderRadius.circular(20),
                        //            )
                        //         ),
                        //           ),
                        //       const SizedBox(height: 20,),
                        //       ListView.builder(
                        //           itemCount: tasks.length,
                        //           itemBuilder:(context,index){
                        //             return TodoCard(title: tasks[index]['title'] ?? '',
                        //                             time: tasks[index]['time'] ?? '',
                        //                              dis: tasks[index]['dis'] ?? '',
                        //                              date: tasks[index]['date'] ?? '',
                        //                              onDelete: ()=> deleteDataBase(tasks[index]['id']),);
                        //           } ),
                        //     ],
                        //   ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF7e64ff),
        shape: CircleBorder(),
        onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskPage()));},
        child:Icon(Icons.add,color: Colors.white,) ,),
    );
  }
}