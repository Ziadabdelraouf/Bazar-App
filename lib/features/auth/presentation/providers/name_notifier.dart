import 'package:flutter_riverpod/flutter_riverpod.dart';

class NameNotifier extends StateNotifier<String> {
  NameNotifier({String initialName = ''}) : super(initialName);

  void updateName(String newName) {
    state = newName;
  }

  void clear() {
    state = '';
  }
}
