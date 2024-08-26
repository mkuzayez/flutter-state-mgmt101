import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_mgmt_101/RiverPod/toDo.dart';
import 'package:state_mgmt_101/ValueNotifier/toDo.dart';
import 'ValueNotifier/counter.dart';

void main() {
  runApp(MaterialApp(theme: ThemeData.dark(), home: const ChooseApp()));
}

Widget? activeScreen;

class ChooseApp extends StatelessWidget {
  const ChooseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
              child: Text("State Mangement 101"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          const ProviderScope(child: ToDo_Riverpod())),
                );
              },
              child: const Text("To Do using Riverpod"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const ToDo_ValueNotifier()),
                );
              },
              child: const Text("To Do using ValueNotifier"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => Counter_ValueNotifier()),
                );
              },
              child: const Text("Counter using ValueNotifier"),
            ),
          ],
        ),
      ),
    );
  }
}
