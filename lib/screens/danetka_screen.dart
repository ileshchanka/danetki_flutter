import 'package:danetki_flutter/models/danetka.dart';
import 'package:flutter/material.dart';

class DanetkaScreen extends StatefulWidget {
  const DanetkaScreen({super.key});

  @override
  State<DanetkaScreen> createState() => _DanetkaScreenState();
}

class _DanetkaScreenState extends State<DanetkaScreen> {
  Danetka? danetka;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;

    assert(args != null && args is Danetka);

    // if (args == null || args is! String) {
    //   print('No');
    //   return;
    // }

    danetka = args as Danetka;
    // setState(() {});

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(danetka?.title ?? '…'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          danetka?.question ?? '…',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
