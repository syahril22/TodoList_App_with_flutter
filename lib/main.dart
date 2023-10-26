import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/pages/welcome_page.dart';
import 'package:todo_list_app/providers/todo_list_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoListProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Daily Task",
        theme: ThemeData(
          primaryColor: const Color(0xFF50C2C9),
        ),
        home: const WelcomePage(),
      ),
    );
  }
}
