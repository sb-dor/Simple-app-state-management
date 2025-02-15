import 'package:flutter/foundation.dart';
import 'package:simple_app_state_management/simple_state_model.dart';

class SimpleChangeNotifier with ChangeNotifier {
  //
  SimpleChangeNotifier({
    required this.firstSimpleStateModel,
    required this.secondSimpleStateModel,
  });

  SimpleStateModel firstSimpleStateModel;
  SimpleStateModel secondSimpleStateModel;

  void increment() {
    firstSimpleStateModel = firstSimpleStateModel.copyWith(
      counter: (firstSimpleStateModel.counter ?? 0) + 1,
    );
    notifyListeners();
  }

  void increment2() {
    secondSimpleStateModel = secondSimpleStateModel.copyWith(
      counter: (secondSimpleStateModel.counter ?? 0) + 1,
    );
    notifyListeners();
  }

  void decrement() {
    firstSimpleStateModel = firstSimpleStateModel.copyWith(
      counter: (firstSimpleStateModel.counter ?? 0) - 1,
    );
    notifyListeners();
  }

  void changeName(String name) {
    firstSimpleStateModel = firstSimpleStateModel.copyWith(name: name);
    notifyListeners();
  }
}
