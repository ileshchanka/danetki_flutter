import 'package:auto_route/annotations.dart';
import 'package:danetki_flutter/models/danetka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc/danetka_details_bloc.dart';

@RoutePage()
class DanetkaScreen extends StatefulWidget {
  const DanetkaScreen({super.key, required this.danetka});

  final Danetka danetka;

  @override
  State<DanetkaScreen> createState() => _DanetkaScreenState();
}

class _DanetkaScreenState extends State<DanetkaScreen> {
  bool _isShownQuestion = true;
  String buttonTextShow = 'Показать ответ';
  String buttonTextHide = 'Скрыть ответ';

  @override
  void initState() {
    GetIt.I<DanetkaDetailsBloc>().add(DanetkaDetailsLoadedEvent(danetka: widget.danetka));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.danetka.title),
      ),
      body: BlocBuilder<DanetkaDetailsBloc, DanetkaDetailsState>(
        bloc: GetIt.I<DanetkaDetailsBloc>(),
        builder: (context, state) {
          if (state is DanetkaDetailsLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (_isShownQuestion ? state.danetka.question : state.danetka.answer),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                _isShownQuestion = !_isShownQuestion;
                              });
                            },
                            child: Text(_isShownQuestion ? buttonTextShow : buttonTextHide))),
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
