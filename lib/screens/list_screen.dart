import 'package:danetki_flutter/bloc/danetki_bloc.dart';
import 'package:danetki_flutter/repository/abstract_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../generated/l10n.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() {
    return _ListScreenState();
  }
}

class _ListScreenState extends State<ListScreen> {
  final _danetkiBloc = DanetkiBloc(GetIt.I<AbstractDanetkiRepository>());

  @override
  void initState() {
    super.initState();
    _danetkiBloc.add(LoadDanetkiEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(S.of(context).danetki),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            _danetkiBloc.add(LoadDanetkiEvent());
          },
          child: BlocBuilder<DanetkiBloc, DanetkiState>(
            bloc: _danetkiBloc,
            builder: (context, state) {
              if (state is DanetkiLoaded) {
                return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(state.list[i].title, style: Theme.of(context).textTheme.titleLarge),
                      // subtitle: Text(danetka.subtitle, style: Theme.of(context).textTheme.titleSmall),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.of(context).pushNamed('/danetka', arguments: state.list[i]);
                      },
                    );
                  },

                  // separatorBuilder: (context, i) => const Divider(),
                );
              }

              if (state is DanetkiLoadingFailed) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.message, style: Theme.of(context).textTheme.titleLarge),
                      TextButton(
                          onPressed: () {
                            _danetkiBloc.add(LoadDanetkiEvent());
                          },
                          child: Text(S.of(context).tryAgain))
                    ],
                  ),
                );
              }

              if (state is DanetkiLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return Container();
            },
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();

    _danetkiBloc.close();
  }
}
