import 'package:flutter/material.dart';
import 'package:todo/app/model/todo_model.dart';
import 'package:todo/app/service/todo_service.dart';
import 'package:todo/app/widgets/textfield_widget.dart';

class Create extends StatelessWidget {
  Create({super.key});

  final tituloController = TextEditingController();
  final descricaoController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final service = TodoService.getInstance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Crie uma nova Tarefa!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
              const Text(
                "Insira os dados abaixo para criar uma\n nova tarefa!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextFieldWidget(
                            controller: tituloController,
                            title: "Titulo",
                            hint: "Insira o titulo!",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldWidget(
                            controller: descricaoController,
                            title: "Descrição",
                            hint: "Insira uma descrição",
                            isTextArea: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.green,
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    service.createTodo(TodoModel(
                        title: tituloController.text,
                        description: descricaoController.text));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Todo criado com sucesso"),
                    ));
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Preencha todos os campos!"),
                    ));
                  }
                },
                child: const Text(
                  "Criar tarefa!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
