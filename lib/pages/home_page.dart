import 'package:flutter/material.dart';
import 'package:todo/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List toDoList = [
    ['Learn Flutter', false],
    ['Drink Coffee', false],
    ['Code with Clinton', false],
  ];

  void checkboxChanged(int index) {
    toDoList[index][1] = !toDoList[index][1];
    setState(() {});
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const Text(
          'Simple Todo',
        ),
        backgroundColor: Colors.white30,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, index) {
          return ToDolist(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkboxChanged(index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 20,
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Add a new todo items',
                  filled: true,
                  fillColor: const Color.fromARGB(31, 58, 57, 57),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(115, 90, 90, 90),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(115, 90, 90, 90),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: saveNewTask,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
