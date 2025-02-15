import 'package:flutter/material.dart';

import 'home_widget.dart';

void main() {
  //
  WidgetsFlutterBinding.ensureInitialized();

  runApp(App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeWidget(),
    );
  }
}
