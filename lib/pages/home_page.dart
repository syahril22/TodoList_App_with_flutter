import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/pages/add_update_task.dart';
import 'package:todo_list_app/providers/todo_list_provider.dart';
import 'package:todo_list_app/widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Daily Task"),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const AddEditTodoWidget(title: "Add Task")));
            },
            icon: const Icon(Icons.add),
            color: Colors.white,
          )
        ],
      ),
      // widget drawer start
      drawer: const DrawerWidget(),
      // widget drawer end
      body: Consumer<TodoListProvider>(builder: (context, todoProvider, chil) {
        return ListView(
          padding: const EdgeInsets.all(20.0),
          children: todoProvider.todoList.isNotEmpty
              ? todoProvider.todoList.map((todo) {
                  return Dismissible(
                    key: Key(todo.id),
                    background: Container(
                      color: Colors.red.shade300,
                      child: const Center(child: Icon(Icons.delete)),
                    ),
                    child: Card(
                      child: ListTile(
                        title: Text(todo.todo),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddEditTodoWidget(
                                        title: "Edit Task",
                                        todo: todo,
                                      )));
                        },
                      ),
                    ),
                    onDismissed: (direction) {
                      Provider.of<TodoListProvider>(
                        context,
                        listen: false,
                      ).removeTodo(todo);
                    },
                  );
                }).toList()
              : [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 100.0,
                    child: const Center(
                      child: Text(
                        "No Task!",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
        );
      }),
    );
  }
}
