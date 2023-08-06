import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const HomeScreen(),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
    );
  }
}

class LayoutWrapper extends StatelessWidget {
  const LayoutWrapper({super.key, required this.builder});

  final Widget Function(bool isLargeScreen) builder;

  @override
  Widget build(BuildContext context) {
    // final isLargeScreen = MediaQuery.sizeOf(context).width > 400;
    // return builder(isLargeScreen);
    return LayoutBuilder(
      builder: (context, constraints) {
        return builder(constraints.maxWidth > 400);
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _textStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const _widgetOptions = <Widget>[
    Text(
      'Index 0',
      style: _textStyle,
    ),
    Text(
      'Index 1',
      style: _textStyle,
    ),
    Text(
      'Index 2',
      style: _textStyle,
    ),
    Text(
      'Index 3',
      style: _textStyle,
    ),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutWrapper(
      builder: (isLargeScreen) => Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        drawer: isLargeScreen
            ? null
            : Drawer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                        height: 200,
                        child: DrawerHeader(
                            decoration: BoxDecoration(color: Colors.blue),
                            child: Text('Drawer Header',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24)))),
                    ListTile(
                      title: const Text('Home'),
                      onTap: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: const Text('Business'),
                      onTap: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: const Text('Feed'),
                      onTap: () {
                        setState(() {
                          _currentIndex = 2;
                        });
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: const Text('Setting'),
                      onTap: () {
                        setState(() {
                          _currentIndex = 3;
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
        bottomNavigationBar: isLargeScreen
            ? BottomNavigationBar(
                backgroundColor: Theme.of(context).primaryColor,
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.business),
                    label: 'Business',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.feed), label: 'Feed'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Setting'),
                ],
                currentIndex: _currentIndex,
                selectedItemColor: Colors.amber[300],
                onTap: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
              )
            : null,
        body: Center(
          child: _widgetOptions[_currentIndex],
        ),
      ),
    );
  }
}
