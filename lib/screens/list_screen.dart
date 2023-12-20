import 'package:danetki_flutter/models/danetka.dart';
import 'package:danetki_flutter/repository.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() {
    return _ListScreenState();
  }
}

class _ListScreenState extends State<ListScreen> {
  final List<Danetka> list = DanetkiRepository().getList();

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
                  subtitle: Text(danetka.subtitle, style: Theme.of(context).textTheme.titleSmall),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context).pushNamed('/danetka', arguments: danetka);
                  },
                );
              },

              // separatorBuilder: (context, i) => const Divider(),
            ),

      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[class MyHomePage extends StatefulWidget {
      //   const MyHomePage({super.key, required this.title});
      //
      //   final String title;
      //
      //   @override
      //   State<MyHomePage> createState() => _MyHomePageState();
      // }
      //
      // class _MyHomePageState extends State<MyHomePage> {
      //   int _counter = 0;
      //
      //   void _incrementCounter() {
      //     setState(() {
      //       _counter++;
      //     });
      //   }
      //
      //   @override
      //   Widget build(BuildContext context) {
      //     return Scaffold(
      //       appBar: AppBar(
      //         backgroundColor: Theme
      //             .of(context)
      //             .colorScheme
      //             .inversePrimary,
      //         title: Text(widget.title),
      //       ),
      //       body: ListView.builder(
      //           itemCount: 10, // TODO Fix
      //           itemBuilder: (context, i) => const ListTile(
      //             title: Text("Danetka")
      //           )),
      //       // body: Center(
      //       //   child: Column(
      //       //     mainAxisAlignment: MainAxisAlignment.center,
      //       //     children: <Widget>[
      //       //       const Text(
      //       //         'You have pushed the button this many times:',
      //       //       ),
      //       //       Text(
      //       //         '$_counter',
      //       //         style: Theme.of(context).textTheme.headlineMedium,
      //       //       ),
      //       //     ],
      //       //   ),
      //       // ),
      //       // floatingActionButton: FloatingActionButton(
      //       //   onPressed: _incrementCounter,
      //       //   tooltip: 'Increment',
      //       //   child: const Icon(Icons.add),
      //       // ), // This trailing comma makes auto-formatting nicer for build methods.
      //     );
      //   }
      // }
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headlineMedium,
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
