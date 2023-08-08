import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class Product {
  String ten;
  String image;
  String mota;
  double price;
  Product(
      {required this.ten,
      required this.image,
      required this.mota,
      required this.price});
}

final List<Product> products = [
  Product(
      ten: 'Sản phẩm 1',
      image: '',
      mota: 'SP1',
      price: 100000),
  Product(
      ten: 'Sản phẩm 2',
      image: '',
      mota: 'SP2',
      price: 200000),
  Product(
      ten: 'Sản phẩm 3',
      image: '',
      mota: 'SP3',
      price: 300000),
  Product(
      ten: 'Sản phẩm 4',
      image: '',
      mota: 'SP4',
      price: 400000),
  // Product('Sản phẩm 1', 'assets/images/products/img_product_1.jpg', 'SP1',
  //     100000),
  // Product('Sản phẩm 2', 'assets/images/products/img_product_2.png', 'SP2',
  //     200000),
  // Product('Sản phẩm 3', 'assets/images/products/img_product_3.jpg', 'SP3',
  //     300000),
  // Product('Sản phẩm 4', 'assets/images/products/img_product_4.jpg', 'SP4',
  //     400000),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Your Product'),
          backgroundColor: Colors.purple,
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Edit Product'),
                        backgroundColor: Colors.purple,
                        actions: [
                          IconButton(
                            onPressed: () {

                            }, 
                            icon: const Icon(
                              Icons.save
                            )
                          )
                        ],
                      ),
                      body: EditForm(),
                    );
                  }
                )
                );
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              ListTile(
                title: const Text('Trang chủ'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: const Text('Sản phẩm'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: const Text('Giỏ hàng'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: HomePage()
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            final product = products[index];
            return _sanpham(
                product.ten, product.image, product.mota, product.price);
          },
          childCount: products.length,
        ),
      ),
    );
  }
}

Widget _sanpham(String ten, String image, String mota, double price) {
  return Container(
    height: 70,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(
          color: Colors.grey.shade100,
          width: 2.0,
        ),
      ),
    ),
    child: Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('$image'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$ten'),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Row(
            children: [
              IconButton(
                color: Colors.purple,
                icon: const Icon(Icons.edit),
                onPressed: () {},
              ),
              IconButton(
                color: Colors.red,
                icon: const Icon(Icons.delete),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


class EditForm extends StatefulWidget {
  const EditForm({super.key});

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Title'
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide a value!';
                    }
                    return null;
                  }
                  
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}