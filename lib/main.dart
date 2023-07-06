import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:timemanagementapp/models/Reminders/reminder_data.dart';
import 'package:timemanagementapp/models/ToDos/todo_data.dart';
import 'package:timemanagementapp/routs.dart';
import 'package:timemanagementapp/screens/home_page/home_page_screen.dart';
import 'package:timemanagementapp/screens/splash/splash_screen.dart';
import 'package:timemanagementapp/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoData()),
        ChangeNotifierProvider(create: (context) => RemindersData()),  // Add RemindersData provider here
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        title: 'Task Management App',
        initialRoute: SplashScreen.routeName,
        routes: routes,
        home: const HomePage(),
      ),
    );
  }
}
