import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
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
        title: const Text('Danetki'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10, // TODO Fix
        itemBuilder: (context, i) {
          const title = 'Danetka';
          return ListTile(
            title: Text(title, style: Theme.of(context).textTheme.titleLarge),
            subtitle: Text('Subtitle', style: Theme.of(context).textTheme.titleSmall),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).pushNamed('/danetka', arguments: title);
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
