import 'package:flutter/material.dart';
import 'simple_change_notifier.dart';
import 'simple_state_model.dart';
import 'simple_value_notifier.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  //
  final SimpleChangeNotifier _simpleValueNotifier = SimpleChangeNotifier(
    firstSimpleStateModel: SimpleStateModel(
      counter: 1,
      name: "first name",
    ),
    secondSimpleStateModel: SimpleStateModel(
      counter: 2,
      name: "second name",
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _simpleValueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple app state management"),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                _simpleValueNotifier.changeName("THE NAME");
              },
              child: Text("Change the name"),
            ),
            TextButton(
              onPressed: () {
                _simpleValueNotifier.increment();
              },
              child: ListenableBuilder(
                listenable: _simpleValueNotifier,
                builder: (context, child) {
                  return Column(
                    children: [
                      Text(_simpleValueNotifier.firstSimpleStateModel.toString()),
                      if (child != null) child,
                    ],
                  );
                },
                child: Column(
                  children: [
                    Text("Somve widget 1"),
                    Text("Somve widget 1"),
                    Text("Somve widget 1"),
                    Text("Somve widget 1"),
                    Text("Somve widget 1"),
                  ],
                ),
              ),
            ),

            // LISTENABLE BUILDER
            // ListenableBuilder(
            //   listenable: _simpleValueNotifier,
            //   builder: (context, child) {
            //     return Column(
            //       children: [
            //         Text(_simpleValueNotifier.value.toString()),
            //         if (child != null) child,
            //       ],
            //     );
            //   },
            //   child: Text("It;s changing"),
            // ),

            AnimatedBuilder(
              animation: _simpleValueNotifier,
              builder: (context, child) {
                return TextButton(
                  onPressed: () {
                    _simpleValueNotifier.increment2();
                  },
                  child: Text(
                    _simpleValueNotifier.secondSimpleStateModel.toString(),
                  ),
                );
              },
            ),
            //
            // ValueListenableBuilder(
            //   valueListenable: _simpleValueNotifier,
            //   builder: (context, value, child) {
            //     return Text(value.toString());
            //   },
            // ),
            //
            // //
            // OwnValueListenableBuilder(
            //   listenable: _simpleValueNotifier,
            //   builder: (context) => TextButton(
            //     onPressed: () {
            //       print(context.size);
            //       _simpleValueNotifier.increment();
            //     },
            //     child: Text(
            //       _simpleValueNotifier.value.toString(),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
