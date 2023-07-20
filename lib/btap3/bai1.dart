import 'package:flutter/material.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Material App',

      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Flutter Demo'),
          ) 
        ),
        body: const HomePage(),
      ),


    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String content1 = "";
  String content2 = "";
  String content3 = "";

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context , constraints) {
        if (constraints.maxWidth < 480) {
          return Scaffold(
            body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6),       
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return Scaffold(
                            appBar: AppBar(
                              title: const Center(
                                child: Text(
                                  'John Doe 1'
                                ),
                              ),
                            ),
                            body: const Center(
                              child: Column(
                                children: [
                                  Text('Ten: John Doe 1'),

                                  Text('Trang thai: Online'),

                                  Text('Gioi thieu: Doing what you like will always keep you happy ...')
                                ],
                              ),
                            ),
                          );
                        }
                      )
                      );
                    },
                    child: const Text(
                    'Ten: John Doe 1',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green
                    ),
                  ),
                  ),
                ),
                

                Padding(
                  padding: const EdgeInsets.all(6),       
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return Scaffold(
                            appBar: AppBar(
                              title: const Center(
                                child: Text(
                                  'John Doe 2'
                                ),
                              ),
                            ),
                            body: const Center(
                              child: Column(
                                children: [
                                  Text('Ten: John Doe 2'),

                                  Text('Trang thai: Online'),

                                  Text('Gioi thieu: Doing what you like will always keep you happy ...')
                                ],
                              ),
                            ),
                          );
                        }
                      )
                      );
                    },
                    child: const Text(
                    'Ten: John Doe 2',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green
                    ),
                  ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(6),       
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return Scaffold(
                            appBar: AppBar(
                              title: const Center(
                                child: Text(
                                  'John Doe 3'
                                ),
                              ),
                            ),
                            body: const Center(
                              child: Column(
                                children: [
                                  Text('Ten: John Doe 3'),

                                  Text('Trang thai: Online'),

                                  Text('Gioi thieu: Doing what you like will always keep you happy ...')
                                ],
                              ),
                            ),
                          );
                        }
                      )
                      );
                    },
                    child: const Text(
                    'Ten: John Doe 3',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green
                    ),
                  ),
                  ),
                ),
              ],
            ),
          ),
          );

        } else {
          return Scaffold(
            body: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              content1 = "Ten: John Doe 1";
                              content2 = 'Trang thai: Online';
                              content3 = 'Gioi thieu: Doing what you like will always keep you happy ...';
                            });
                          },
                          child: const Text(
                            'John Doe 1',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green
                            ),
                          )                   
                        ),
                      ),
                      

                      Padding(
                        padding: const EdgeInsets.all(6),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              content1 = "Ten: John Doe 2";
                              content2 = 'Trang thai: Online';
                              content3 = 'Gioi thieu: Doing what you like will always keep you happy ...';
                            });
                          },
                          child: const Text(
                            'John Doe 2',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green
                            ),
                          )                   
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(6),
                        child: TextButton(          
                          onPressed: () {
                            setState(() {
                              content1 = "Ten: John Doe 3";
                              content2 = 'Trang thai: Online';
                              content3 = 'Gioi thieu: Doing what you like will always keep you happy ...';
                            });
                          },
                          child: const Text(
                            'John Doe 3',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green
                            ),
                          )                   
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.grey[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('$content1'),
                        Text('$content2'),
                        Text('$content3')
                      ],
                    ),
                  )
                  
                ),
              ],
            ),
          );
        }
      }
    );
  }
}

