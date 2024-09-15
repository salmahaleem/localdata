import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 TextEditingController titleController = TextEditingController();
 TextEditingController disController = TextEditingController();
 TextEditingController timeController = TextEditingController();
 TextEditingController dateController = TextEditingController();

String title = "";
String dis = "";
String time = "";
String date = "";

List<Map<String, dynamic>> tasks = [];

//var scaffoldKey= GlobalKey<ScaffoldState>();
final formKey=GlobalKey<FormState>();