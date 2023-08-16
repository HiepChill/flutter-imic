import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

const primaryColor = Colors.purple;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('MyShop'),
              backgroundColor: primaryColor,
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
                Consumer<ProductModel>(
                  builder: (context, value, child) => Padding(
                    padding: const EdgeInsets.only(top: 8, right: 10),
                    child: Badge(
                      label: Builder(builder: (context) {
                        return Text('${context.watch<ProductModel>().counter}');
                      }),
                      child: IconButton(
                        icon: const Icon(Icons.shopping_cart),
                        onPressed: () {},
                      ),
                    ),
                  ),
                )
              ],
            ),
            drawer: const Drawer(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Home'),
                  ),
                  ListTile(
                    title: Text('Cart'),
                  )
                ],
              ),
            ),
            body: HomePage()),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Container(
        color: Color.fromARGB(255, 236, 212, 212),
        child: Expanded(
            child: GridView.builder(
          itemCount: context.watch<ProductModel>().products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/nike.png'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(172, 0, 0, 0),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_outline_sharp),
                            color: primaryColor,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return DetailScreen();
                                },
                              ));
                            },
                            child: Text(
                              'SP',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(),
                          ),
                          IconButton(
                            onPressed: () {
                              final counter = context.read<ProductModel>();

                              counter.incrementCounter();
                            },
                            icon: const Icon(Icons.shopping_cart),
                            color: primaryColor,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        )),
      ),
    );
  }
}

class Product {
  int id;
  String ten;
  String image;
  String mota;
  double price;
  Product(
      {required this.id,
      required this.ten,
      required this.image,
      required this.mota,
      required this.price});
}

class ProductModel extends ChangeNotifier {
  // final List _productItems = [
  //   //[productName , productImage]
  //   ['Sản phẩm 1', 'assets/images/nike.png'],
  //   ['Sản phẩm 2', 'assets/images/nike1.png'],
  //   ['Sản phẩm 3', 'assets/images/nike2.png'],
  //   ['Sản phẩm 4', 'assets/images/nike3.png'],
  // ];

  final List<Product> _products = [
    Product(
        id: 1,
        ten: 'Sản phẩm 1',
        image: 'assets/images/nike.png',
        mota: 'SP1',
        price: 100000),
    Product(
        id: 2,
        ten: 'Sản phẩm 2',
        image: 'assets/images/nike1.png',
        mota: 'SP2',
        price: 200000),
    Product(
        id: 3,
        ten: 'Sản phẩm 3',
        image: 'assets/images/nike2.png',
        mota: 'SP3',
        price: 300000),
    Product(
        id: 4,
        ten: 'Sản phẩm 4',
        image: 'assets/images/products/nike3.png',
        mota: 'SP4',
        price: 400000),
  ];
  List get products => _products;

  int _counter = 0;
  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  int get counter => _counter;

  // get productItems => _productItems;
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/af1.png'))),
                ),
                Text(
                  '92.65',
                  style: TextStyle(color: Colors.grey),
                ),
                Text('This is demo product')
              ],
            )
          ],
        ),
      ),
    );
  }
}
