
import "package:flutter/material.dart";

class ToDo_ValueNotifier extends StatefulWidget {
  const ToDo_ValueNotifier({super.key});

  @override
  _ToDo_ValueNotifierState createState() => _ToDo_ValueNotifierState();
}

class _ToDo_ValueNotifierState extends State<ToDo_ValueNotifier> {
  ValueNotifier<List<String>> todoList = ValueNotifier([
    "Pay the bills",
    "Buy grociries",
    "Workout",
    "Read",
    "Code",
    "Do laundry"
  ]);
  ValueNotifier<List<String>> doneList = ValueNotifier([]);

  void moveItem(ValueNotifier<List<String>> toDo,
      ValueNotifier<List<String>> done, String item) {
    toDo.value = List.from(toDo.value)..remove(item);
    done.value = List.from(done.value)..add(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To Do App")),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ValueListenableBuilder<List<String>>(
              valueListenable: todoList,
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      tileColor: Colors.blueAccent,
                      title: Text(value[index]),
                      onTap: () => moveItem(todoList, doneList, value[index]),
                    );
                  },
                );
              },
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<List<String>>(
              valueListenable: doneList,
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      tileColor: Colors.redAccent,
                      title: Text(value[index]),
                      onTap: () => moveItem(doneList, todoList, value[index]),
                    );
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


