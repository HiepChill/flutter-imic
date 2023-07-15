import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'So nguyen to'
          ),
        ),
        body: Prime(),
      ),
    );
  }
}

class Prime extends StatefulWidget {
  const Prime({super.key});

  @override
  State<Prime> createState() => _PrimeState();
}

class _PrimeState extends State<Prime> {
  TextEditingController numberValue = TextEditingController();
  String result = '';

  void ResultPrimeNumber() {
    int n = int.tryParse(numberValue.text) ?? 0;

    setState(() {
      if (n < 2) {
        result = '$n khong phải la so nguyen to';
      }
      for (int i = 2 ; i < n / 2; i ++) {
        if (n % i == 0) {
          result = '$n khong phải la so nguyen to';
          break;
        }
        result = '$n là số nguyên tố';
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          TextField(
            controller: numberValue,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Nhập số để kiểm tra',
              border: OutlineInputBorder(),
            ),
          ),

          ElevatedButton(
            onPressed: ResultPrimeNumber,
            child: Text(
              'Check'
            ),
          ),
          Text(
            result,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red
            ),
          ),
        ],
      ),
    );
  }
}
