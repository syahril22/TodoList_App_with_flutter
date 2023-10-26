import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/models/todo_model.dart';
import 'package:todo_list_app/providers/todo_list_provider.dart';
import 'package:uuid/uuid.dart';

class AddEditTodoWidget extends StatefulWidget {
  final String title;
  final TodoModel? todo;
  const AddEditTodoWidget({Key? key, required this.title, this.todo});

  @override
  State<AddEditTodoWidget> createState() => _AddEditTodoWidgetState();
}

class _AddEditTodoWidgetState extends State<AddEditTodoWidget> {
  TextEditingController todoController = TextEditingController();
  bool isInputEmpty = false;

  @override
  void initState() {
    super.initState();
    todoController.addListener(() {
      setState(() {
        isInputEmpty = todoController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.todo != null) {
      todoController.text = widget.todo!.todo;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: todoController,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: isInputEmpty
                      ? "input cannot be empty"
                      : "Enter your new tasks here",
                  labelStyle: TextStyle(
                    color: isInputEmpty ? Colors.red : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (todoController.text.isEmpty) {
            setState(() {
              isInputEmpty = true;
            });
          } else {
            if (widget.todo == null) {
              const uuid = Uuid();
              Provider.of<TodoListProvider>(context, listen: false).addTodo(
                TodoModel(id: uuid.v4(), todo: todoController.text),
              );
            } else {
              Provider.of<TodoListProvider>(context, listen: false).updateTodo(
                TodoModel(
                  id: widget.todo!.id,
                  todo: todoController.text,
                ),
              );
            }
            Navigator.pop(context);
          }
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.check,
        ),
      ),
    );
  }
}
