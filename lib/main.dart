import 'package:flutter/material.dart';
import 'package:localdata_app/core/shared.dart';
import 'package:localdata_app/features/home/home_page.dart';
import 'package:localdata_app/features/home/profile.dart';
import 'package:localdata_app/features/login_sginup/login_page.dart';
import 'package:localdata_app/features/login_sginup/signUp_page.dart';
import 'package:provider/provider.dart';

import 'core/provider_task.dart';
import 'features/splach.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Shared.sharedInitialization();
  runApp( MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => TaskProvider()),
      ],child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF180e2b)),
        useMaterial3: true,
      ),
      home: Splach(),
    );
  }
}




