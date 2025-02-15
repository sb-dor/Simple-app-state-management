import 'package:flutter/foundation.dart';

import 'simple_state_model.dart';

// class OwnValueNotifier<T> with ChangeNotifier implements ValueListenable<T> {
//   //
//   OwnValueNotifier(this._value);
//
//   T _value;
//
//   set value(T newValue) {
//     if (_value == newValue) return;
//     _value = newValue;
//     notifyListeners();
//   }
//
//   @override
//   T get value => _value;
// }

class SimpleValueNotifier extends ValueNotifier<SimpleStateModel> {
  SimpleValueNotifier(super.value);

  void increment() {
    value = value.copyWith(counter: (value.counter ?? 0) + 1);
  }

  void decrement() {
    value = value.copyWith(counter: (value.counter ?? 0) - 1);
  }

  void changeName(String name) {
    value = value.copyWith(name: name);
  }
}
