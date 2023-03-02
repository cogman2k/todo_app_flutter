import 'package:flutter/material.dart';

// Align addButtonWidget(context, colorTheme, newTodoController, addTodo) {
//   return Align(
//     alignment: Alignment.bottomRight,
//     child: CircleAvatar(
//       radius: 30,
//       backgroundColor: Colors.amberAccent,
//       child: IconButton(
//         onPressed: () {
//           Scaffold.of(context).showBottomSheet((context) => Text("abc"));
//         },
//         // onPressed: () => showDialog<String>(
//         //   context: context,
//         //   builder: (BuildContext context) => AlertDialog(
//         //     content: TextField(
//         //       controller: newTodoController,
//         //       decoration: const InputDecoration(
//         //         hintText: 'Enter todo title',
//         //       ),
//         //     ),
//         //     actions: <Widget>[
//         //       TextButton(
//         //         onPressed: () => Navigator.pop(context, 'Cancel'),
//         //         style: ButtonStyle(
//         //             backgroundColor: MaterialStateProperty.all(Colors.grey)),
//         //         child: const Text(
//         //           'Cancel',
//         //           style: TextStyle(color: Colors.white),
//         //         ),
//         //       ),
//         //       TextButton(
//         //         onPressed: () => {addTodo(newTodoController.text)},
//         //         style: ButtonStyle(
//         //           backgroundColor: MaterialStateProperty.all(Colors.amber),
//         //         ),
//         //         child: const Text(
//         //           'Add',
//         //           style: TextStyle(color: Colors.black),
//         //         ),
//         //       ),
//         //     ],
//         //   ),
//         // ),
//         icon: const Icon(Icons.add, color: Colors.black),
//       ),
//     ),
//   );
// }

class AddButtonWidget extends StatelessWidget {
  final Function addTodo;
  final dynamic newTodoController;
  final Map colorTheme;
  const AddButtonWidget(
      {super.key,
      required this.colorTheme,
      required this.newTodoController,
      required this.addTodo});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.amberAccent,
        child: IconButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: TextField(
                controller: newTodoController,
                decoration: const InputDecoration(
                  hintText: 'Enter todo title',
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey)),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    addTodo(newTodoController.text);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          icon: const Icon(Icons.add, color: Colors.black),
        ),
      ),
    );
  }
}
