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
  List<Danetka>? _danetkaList;

  @override
  void initState() {
    super.initState();
    _loadList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Danetki'),
        centerTitle: true,
      ),
      body: _danetkaList == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _danetkaList!.length, // TODO Replace '!'
              itemBuilder: (context, i) {
                final danetka = _danetkaList?[i];
                return ListTile(
                  title: Text(danetka!.title, style: Theme.of(context).textTheme.titleLarge), // TODO Replace '!'
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

  void _loadList() async {
    _danetkaList = await GetIt.I<AbstractDanetkiRepository>().getList();
    setState(() {});
  }
}
