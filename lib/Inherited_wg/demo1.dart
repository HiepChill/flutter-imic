import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = CounterData.of(context);
    print('counter: $counter');
    return ColorData(
      color: Colors.orange,
      child: MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: Center(
            child: CounterData(
                counter: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    const BWidget(),
                    Builder(
                      builder: (context) {
                        final color =
                            ColorData.of(context)?.color ?? Colors.black;
                        return ColoredBox(
                          color: color,
                          child: const SizedBox(
                            width: 100,
                            height: 100,
                          ),
                        );
                      },
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

class ColorData extends InheritedWidget {
  final Color color;
  const ColorData({super.key, required super.child, required this.color});

  static ColorData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorData>();
  }

  @override
  bool updateShouldNotify(ColorData oldWidget) {
    return true;
  }
}

class CounterData extends InheritedWidget {
  final int counter;
  const CounterData({super.key, required super.child, required this.counter});

  static CounterData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterData>();
  }

  @override
  bool updateShouldNotify(CounterData oldWidget) {
    return true;
  }
}

class AWidget extends StatelessWidget {
  const AWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = CounterData.of(context)?.counter;
    return Column(
      children: [
        Text('A widget with counter $counter'),
        const A1Widget(),
      ],
    );
  }
}

class A1Widget extends StatelessWidget {
  const A1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = CounterData.of(context)?.counter;
    final color = ColorData.of(context)?.color ?? Colors.black;
    return Text(
      'A1 widget with counter $counter',
      style: TextStyle(color: color),
    );
  }
}

class BWidget extends StatelessWidget {
  const BWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = CounterData.of(context)?.counter;
    return Text('B widget with counter $counter');
  }
}

