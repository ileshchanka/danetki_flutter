import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 10, // TODO Fix
        itemBuilder: (context, i) => ListTile(
          title: Text("Danetka", style: Theme.of(context).textTheme.titleLarge),
          subtitle: Text("Subtitle", style: Theme.of(context).textTheme.titleSmall),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),

        separatorBuilder: (context, i) => const Divider(),
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
