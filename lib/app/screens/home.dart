import 'package:flutter/material.dart';
import 'package:todo/app/service/todo_service.dart';
import 'package:todo/app/widgets/todo_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final servico = TodoService.getInstance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("TODO",
            style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
      body: ListView.builder(
        itemCount: servico.getTodo.length,
        itemBuilder: (context, index) {
          final item = servico.getTodo[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TodoWidget(
              title: item.title,
              description: item.description,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.add, color: Colors.white, size: 30),
        onPressed: () {
          Navigator.pushNamed(context, "/create")
              .whenComplete(() => setState(() {}));
        },
      ),
    );
  }
}
