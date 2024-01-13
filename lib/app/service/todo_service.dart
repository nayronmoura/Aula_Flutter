import 'package:todo/app/model/todo_model.dart';

class TodoService {
  TodoService._();
  static TodoService? _instance;
  final List<TodoModel> _todos = [];

  static TodoService get getInstance {
    _instance ??= TodoService._();
    return _instance!;
  }

  void createTodo(TodoModel model) {
    _todos.add(model);
  }

  List<TodoModel> get getTodo {
    return _todos;
  }
}
