import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<CounterProvider>(
        create: (context) => CounterProvider(),
        child: const MyHomePage(
          title: 'Demo Provider',
        ),
      ),
    );
  }
}

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  int get counter => _counter;
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final counter = context.read<CounterProvider>().counter;
    // the same with
    // final counter2 = Provider.of<CounterProvider>(context, listen: false).counter;
    debugPrint('build $counter');
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Builder(builder: (context) {
              return Text(
                '${context.watch<CounterProvider>().counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
            Consumer<CounterProvider>(
              builder: (context, value, child) => Text(
                _checkNumber(value.counter),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Consumer<CounterProvider>(
              builder: (context, value, child) => Text(
                _checkNumber(value.counter),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('1'),
                Text('2'),
                Text('3'),
                Text('4'),
                Text('5'),
                Text('6'),
                Text('7'),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterProvider>().incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  String _checkNumber(int number) {
    if (number % 2 == 0) {
      return 'Là số chẵn';
    } else {
      return 'Là số lẻ';
    }
  }
}
