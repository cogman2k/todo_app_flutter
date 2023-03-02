import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class ListWidget extends StatelessWidget {
  final Map colorTheme;
  final String filter;
  final List filterTodos;
  final Function updateStatus;
  final Function removeTodo;

  const ListWidget(
      {super.key,
      required this.colorTheme,
      required this.filter,
      required this.filterTodos,
      required this.updateStatus,
      required this.removeTodo});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(children: [
        for (ToDo todo in filterTodos)
          itemTodo(colorTheme, todo, updateStatus, removeTodo)
      ]),
    );
  }
}

Container itemTodo(colorTheme, todo, updateStatus, removeTodo) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorTheme['secondColor']),
      child: ListTile(
          onTap: () {
            updateStatus(todo);
          },
          title: Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Text(
                todo.title,
                style: TextStyle(
                  color: colorTheme['mainColor'],
                  decoration: todo.done
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontWeight: !todo.done ? FontWeight.bold : null,
                ),
              )),
          subtitle: Text(
            todo.date,
            style: TextStyle(color: colorTheme['mainColor'], fontSize: 13),
          ),
          leading: todo.done
              ? const Icon(
                  Icons.done,
                  color: Colors.green,
                )
              : const Icon(
                  Icons.directions_run,
                  color: Colors.amber,
                ),
          trailing: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(5)),
            child: IconButton(
              icon: const Icon(
                Icons.delete_sharp,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {
                removeTodo(todo.id);
              },
            ),
          )));
}
