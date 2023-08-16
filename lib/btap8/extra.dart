import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Popular Movie',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          body: HomePage()),
    );
  }
}

var jsonList;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void InitState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      var response = await Dio()
          .get('https://protocoderspoint.com/jsondata/superheros.json');

      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data['superheros'] as List;
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: jsonList == null ? 0 : jsonList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network(jsonList[index]['url']),
              title: Text(
                jsonList[index]['name'],
                style: TextStyle(color: Colors.black),
              ),
              subtitle: Text(jsonList[index]['power']),
            ),
          );
        },
      ),
    );
  }
}
