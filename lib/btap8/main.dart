import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class NetworkProvider extends ChangeNotifier {
  Response<dynamic>? response;

  void getData() async {
    var response = await Dio()
        .get('https://protocoderspoint.com/jsondata/superheros.json');

    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ChangeNotifierProvider(
        create: (context) => NetworkProvider()..getData(),
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Popular content',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Consumer<NetworkProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final data = (value.response?.data as List);
                    return Card(
                      child: ListTile(
                        leading: Image.asset('${data[index]['url']}'),
                        title: Text(
                          '${data[index]['name']}',
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text('${data[index]['power']}'),
                      ),
                    );
                  },
                  itemCount: (value.response?.data as List?)?.length ?? 0,
                );
              },
            )),
      ),
    );
  }
}
