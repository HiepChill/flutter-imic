import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

final dio = Dio();

class DemoHttpNetworkProvider extends ChangeNotifier {
  Response<dynamic>? postData;

  getPosts() async {
    postData = await dio.get('https://api.themoviedb.org/3/movie/popular');
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
        create: (context) => DemoHttpNetworkProvider()..getPosts(),
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Material App Bar'),
            ),
            body: Consumer<DemoHttpNetworkProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: (value.postData?.data as List?)?.length ?? 0,
                  itemBuilder: (context, index) {
                    final data = (value.postData?.data as List);
                    return Text(
                      '${data[index]['id']}--${data[index]['title']}',
                    );
                  },
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
