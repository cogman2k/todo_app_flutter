import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/filter_widget.dart';
import 'package:todo_app/widgets/form_widget.dart';
import 'package:todo_app/widgets/list_widget.dart';
import 'package:todo_app/widgets/search_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String mode = 'dark';
  dynamic colorTheme = darkMode;
  String filter = 'All';
  List<ToDo> mainTodos = ToDo.initTodoList();
  List<ToDo> filterTodos = ToDo.initTodoList();
  final newTodoController = TextEditingController();

  // CHANGE MODE
  changeMode() {
    setState(() {
      mode = mode == 'light' ? 'dark' : 'light';
      colorTheme = mode == 'light' ? lightMode : darkMode;
    });
  }

  // FILTER
  changeFilter(String value) {
    setState(() {
      filter = value;
      if (value == 'Done') {
        setState(() {
          filterTodos = mainTodos;
          filterTodos = mainTodos.where((todo) => todo.done).toList();
        });
      } else if (value == 'Doing') {
        setState(() {
          filterTodos = mainTodos;
          filterTodos = mainTodos.where((todo) => !todo.done).toList();
        });
      } else {
        setState(() {
          filterTodos = mainTodos;
        });
      }
    });
  }

  searchFilter(String value) {
    // clone ra da
    if (value.isNotEmpty) {
      setState(() {
        filterTodos = mainTodos
            .where((item) => item.title!.toLowerCase().contains(value))
            .toList();
      });
    } else {
      setState(() {
        filterTodos = mainTodos;
      });
    }
  }

  // UPDATE TODO
  updateStatus(ToDo todo) {
    setState(() => {
          todo.done = !todo.done,
          mainTodos = filterTodos,
        });
  }

  // ADD NEW TODO
  addTodo(String todoTitle) {
    setState(() {
      mainTodos.add(ToDo(
          id: DateTime.now().millisecond.toString(),
          title: todoTitle,
          date: DateFormat('yyyy/MM/dd H:mm').format(DateTime.now())));
      filterTodos = mainTodos;
    });
    Navigator.pop(context, 'Add');
    newTodoController.clear();
  }

  // REMOVE TODO
  removeTodo(todoId) {
    setState(() {
      mainTodos.removeWhere((todo) => todo.id == todoId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorTheme['mainColor'],
      appBar: appBarWidget(colorTheme, mode, changeMode),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SearchWidget(colorTheme: colorTheme, searchFilter: searchFilter),
              FilterWidget(
                  colorTheme: colorTheme,
                  changeFilter: changeFilter,
                  filter: filter),
              Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '$filter Todos',
                        style: TextStyle(
                            color: colorTheme['secondColor'],
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              ListWidget(
                  colorTheme: colorTheme,
                  filter: filter,
                  filterTodos: filterTodos,
                  updateStatus: updateStatus,
                  removeTodo: removeTodo),
              AddButtonWidget(
                  colorTheme: colorTheme,
                  newTodoController: newTodoController,
                  addTodo: addTodo)
            ],
          )),
    );
  }
}

AppBar appBarWidget(colorTheme, mode, changeMode) {
  return AppBar(
    leading: Icon(
      Icons.home,
      color: colorTheme['secondColor'],
      size: 30,
    ),
    title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text('Todo App', style: TextStyle(color: colorTheme['secondColor'])),
      IconButton(
          onPressed: changeMode,
          icon: mode == 'light'
              ? Icon(
                  Icons.mode_night,
                  color: colorTheme['secondColor'],
                )
              : Icon(
                  Icons.light_mode,
                  color: colorTheme['secondColor'],
                ))
    ]),
    backgroundColor: colorTheme['mainColor'],
  );
}
