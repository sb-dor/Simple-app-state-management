import 'package:flutter/material.dart';

typedef OwnValueBuilder = Widget Function(BuildContext context);

class OwnValueListenableBuilder extends StatefulWidget {
  const OwnValueListenableBuilder({
    super.key,
    required this.listenable,
    required this.builder,
  });

  final Listenable listenable;
  final OwnValueBuilder builder;

  @override
  State<OwnValueListenableBuilder> createState() => _OwnValueListenableBuilderState();
}

class _OwnValueListenableBuilderState extends State<OwnValueListenableBuilder> {
  @override
  void initState() {
    super.initState();
    widget.listenable.addListener(_listener);
  }

  @override
  void dispose() {
    widget.listenable.removeListener(_listener);
    super.dispose();
  }

  void _listener() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
