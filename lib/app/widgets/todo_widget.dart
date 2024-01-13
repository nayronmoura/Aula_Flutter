import 'package:flutter/material.dart';

class TodoWidget extends StatefulWidget {
  final String title;
  final String description;

  const TodoWidget({super.key, required this.title, required this.description});

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    final descriptionList = widget.description.split(" ");
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            blurRadius: 10,
            spreadRadius: 0.2,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 30),
                ),
                const Divider(),
                Text(
                  "${descriptionList.sublist(0, (descriptionList.length / 2).round()).join(" ")}...",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          constraints: const BoxConstraints(minHeight: 200),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                widget.description,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          )),
                    );
                  });
            },
            icon: const Icon(Icons.remove_red_eye),
          )
        ],
      ),
    );
  }
}
