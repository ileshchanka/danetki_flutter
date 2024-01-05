import 'package:auto_route/annotations.dart';
import 'package:danetki_flutter/models/danetka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/danetka_details_bloc.dart';

@RoutePage()
class DanetkaScreen extends StatefulWidget {
  const DanetkaScreen({super.key, required this.danetka});

  final Danetka danetka;

  @override
  State<DanetkaScreen> createState() => _DanetkaScreenState();
}

class _DanetkaScreenState extends State<DanetkaScreen> {
  bool isShownQuestion = true;
  String buttonTextShow = 'Показать ответ';
  String buttonTextHide = 'Скрыть ответ';

  final _danetkaDetailsBloc = DanetkaDetailsBloc();

  @override
  void initState() {
    _danetkaDetailsBloc.add(DanetkaDetailsLoadedEvent(danetka: widget.danetka));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.danetka.title ?? '…'),
      ),
      body: BlocBuilder<DanetkaDetailsBloc, DanetkaDetailsState>(
        bloc: _danetkaDetailsBloc,
        builder: (context, state) {
          if (state is DanetkaDetailsLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (isShownQuestion ? state.danetka.question : state.danetka.answer) ?? '…',
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
            );
          }
          return Container();
        },
      ),
    );
  }
}
