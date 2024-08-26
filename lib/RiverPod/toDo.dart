import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import './toDo_Provider.dart';

class ToDo_Riverpod extends ConsumerStatefulWidget {
  const ToDo_Riverpod({super.key});

  @override
  ConsumerState<ToDo_Riverpod> createState() => _ToDoState();
}

class _ToDoState extends ConsumerState<ToDo_Riverpod> {
  List todoList = [
    "Pay the bills",
    "Buy grociries",
    "Workout",
    "Read",
    "Code",
    "Do laundry"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To Do App")),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Colors.blueAccent,
                  title: Text(todoList[index]),
                  onTap: () {
                    ref.watch(ToDoProvider.notifier).add(todoList[index]);
                    setState(() {
                      todoList.remove(todoList[index]);
                    });
                  },
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ref.read(ToDoProvider.notifier).state.length,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Colors.redAccent,
                  title: Text(ref.watch(ToDoProvider.notifier).state[index]),
                  onTap: () {
                    ref
                        .watch(ToDoProvider.notifier)
                        .remove(ref.read(ToDoProvider.notifier).state[index]);
                    setState(() {
                      todoList
                          .add(ref.watch(ToDoProvider.notifier).state[index]);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
