import 'package:flutter/foundation.dart';

@immutable
final class SimpleStateModel {
  final int? counter;
  final String? name;

  const SimpleStateModel({
    this.counter,
    this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SimpleStateModel &&
          runtimeType == other.runtimeType &&
          counter == other.counter &&
          name == other.name);

  @override
  int get hashCode => counter.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'SimpleStateModel{' + ' counter: $counter,' + ' name: $name,' + '}';
  }

  SimpleStateModel copyWith({
    int? counter,
    String? name,
  }) {
    return SimpleStateModel(
      counter: counter ?? this.counter,
      name: name ?? this.name,
    );
  }
}
