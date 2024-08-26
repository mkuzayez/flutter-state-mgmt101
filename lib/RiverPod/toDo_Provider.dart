import "package:flutter_riverpod/flutter_riverpod.dart";

class ToDoNotifier extends StateNotifier<List<String>> {
  ToDoNotifier() : super([]);

  void add(String task) {
    state = [...state, task];
  }

  void remove(String task) {
    state = state.where((item) => item != task).toList();
  }
}

final ToDoProvider = StateNotifierProvider(
  (ref) {
    return ToDoNotifier();
  },
);
