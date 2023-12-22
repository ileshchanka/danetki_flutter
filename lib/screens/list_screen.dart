import 'package:danetki_flutter/models/danetka.dart';
import 'package:danetki_flutter/repository/abstract_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() {
    return _ListScreenState();
  }
}

class _ListScreenState extends State<ListScreen> {
  final List<Danetka> list = GetIt.I<AbstractDanetkiRepository>().getList();

  void _incrementCounter() {
    setState(() {
      // _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Danetki'),
        centerTitle: true,
      ),
      body: list.isEmpty
          ? const SizedBox()
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i) {
                final danetka = list[i];
                return ListTile(
                  title: Text(danetka.title, style: Theme.of(context).textTheme.titleLarge),
                  // subtitle: Text(danetka.subtitle, style: Theme.of(context).textTheme.titleSmall),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context).pushNamed('/danetka', arguments: danetka);
                  },
                );
              },

              // separatorBuilder: (context, i) => const Divider(),
            ),
    );
  }
}
