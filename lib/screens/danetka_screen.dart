import 'package:flutter/material.dart';

class DanetkaScreen extends StatefulWidget {
  const DanetkaScreen({super.key});

  @override
  State<DanetkaScreen> createState() => _DanetkaScreenState();
}

class _DanetkaScreenState extends State<DanetkaScreen> {
  String? title;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;

    assert(args != null && args is String, '');

    // if (args == null || args is! String) {
    //   print('No');
    //   return;
    // }

    title = args as String;
    // setState(() {});

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? "…"),
      ),
      body: const Text('Test'),
    );
  }
}
