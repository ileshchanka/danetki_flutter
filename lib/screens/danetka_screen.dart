import 'package:danetki_flutter/models/danetka.dart';
import 'package:flutter/material.dart';

class DanetkaScreen extends StatefulWidget {
  const DanetkaScreen({super.key});

  @override
  State<DanetkaScreen> createState() => _DanetkaScreenState();
}

class _DanetkaScreenState extends State<DanetkaScreen> {
  Danetka? danetka;
  bool isShownQuestion = true;
  String buttonTextShow = 'Показать ответ';
  String buttonTextHide = 'Скрыть ответ';

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is Danetka);

    danetka = args as Danetka;
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (isShownQuestion ? danetka?.question : danetka?.answer) ?? '…',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          isShownQuestion = !isShownQuestion;
                        });
                      },
                      child: Text(isShownQuestion ? buttonTextShow : buttonTextHide))),
            )
          ],
        ),
      ),
    );
  }
}
