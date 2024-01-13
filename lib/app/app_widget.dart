import 'package:todo/app/screens/create.dart';
import 'package:todo/app/screens/home.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TODO",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      routes: {
        "/": (context) => const Home(),
        '/create': (context) => Create()
      },
    );
  }
}
