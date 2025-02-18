typedef Subscriber = void Function();

abstract class OwnListenable {
  //
  void addListener(Subscriber subscriber);

  void removeListener(Subscriber subscriber);
}

mixin class OwnChangeNotifier implements OwnListenable {
  //

  final List<Subscriber> _subscribers = [];

  @override
  void addListener(Subscriber subscriber) {
    _subscribers.add(subscriber);
  }

  @override
  void removeListener(Subscriber subscriber) {
    for (int i = 0; i < _subscribers.length; i++) {
      if (_subscribers[i] == subscriber) {
        _subscribers.removeAt(i);
        break;
      }
    }
  }

  void notifySubscribers() {
    for (final subscriber in _subscribers) {
      subscriber.call();
    }
  }

  void dispose() {
    _subscribers.clear();
  }
}
