
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

const Color cl = Colors.purple;

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
      image: 'assets/images/products/img_product_1.jpg',
      mota: 'SP1',
      price: 100000),
  Product(
      ten: 'Sản phẩm 2',
      image: 'assets/images/products/img_product_2.png',
      mota: 'SP2',
      price: 200000),
  Product(
      ten: 'Sản phẩm 3',
      image: 'assets/images/products/img_product_3.jpg',
      mota: 'SP3',
      price: 300000),
  Product(
      ten: 'Sản phẩm 4',
      image: 'assets/images/products/img_product_4.jpg',
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

enum Change {
  login,
  signup,
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MianApp(),
    );
  }
}

class MianApp extends StatefulWidget {
  const MianApp({super.key});

  @override
  State<MianApp> createState() => _MianAppState();
}

class _MianAppState extends State<MianApp> {
  Change _currentState = Change.login;

  void _switchLogin() {
    setState(() {
      _currentState = Change.login;
    });
  }

  void _switchSignup() {
    setState(() {
      _currentState = Change.signup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _currentState == Change.login
        ? LoginForm(switchToSignUp: _switchSignup)
        : SignupForm(switchToLogin: _switchLogin);
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, required this.switchToSignUp});
  final Function switchToSignUp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [cl, Colors.orange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.rotate(
                angle: -math.pi / 50,
                child: Container(
                  alignment: Alignment.topCenter,
                  width: 390,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'MyShop',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 55,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Container(
                width: 300,
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 30, left: 10, right: 10, bottom: 10),
                      child: SizedBox(
                        child: TextField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'E-Mail',
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 0, left: 10, right: 10, bottom: 20),
                      child: SizedBox(
                        child: TextField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return DanhSachSanpham(
                                  products: products,
                                );
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cl,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text('LOGIN'),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        switchToSignUp();
                      },
                      child: const Text(
                        'SIGNUP INSTEAD',
                        style: TextStyle(
                          color: cl,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DanhSachSanpham extends StatefulWidget {
  final List<Product> products;
  const DanhSachSanpham({super.key, required this.products});

  @override
  State<DanhSachSanpham> createState() => _DanhSachSanphamState();
}

class _DanhSachSanphamState extends State<DanhSachSanpham> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Product'),
        backgroundColor: cl,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return AddProductScreen(
                      products: products,
                    );
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(color: cl),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Đăng xuất'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      // body: ListView.builder(
      //   itemCount: products.length,
      //   itemBuilder: (context, index) {
      //     final product = products[index];
      //     return ListTile(
      //       leading: Image.asset(product.image),
      //       title: Text(product.ten),
      //       subtitle: Text('ID: ${product.id}'),
      //     );
      //   },
      // ),
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

class SignupForm extends StatelessWidget {
  const SignupForm({super.key, required this.switchToLogin});
  final Function switchToLogin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [cl, Colors.orange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.rotate(
                angle: -math.pi / 50,
                child: Container(
                  alignment: Alignment.topCenter,
                  width: 390,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'MyShop',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 55,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Container(
                width: 300,
                height: 390,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 30, left: 10, right: 10, bottom: 10),
                      child: SizedBox(
                        child: TextField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'E-Mail',
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 0, left: 10, right: 10, bottom: 10),
                      child: SizedBox(
                        child: TextField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 0, left: 10, right: 10, bottom: 20),
                      child: SizedBox(
                        child: TextField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Cofirm Password',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cl,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text('SIGN UP'),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        switchToLogin();
                      },
                      child: const Text(
                        'LOGIN INSTEAD',
                        style: TextStyle(
                          color: cl,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class DanhSachSanpham extends StatelessWidget {
//   const DanhSachSanpham({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Your Product'),
//         backgroundColor: cl,
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) {
//                     return AddProductScreen(
//                       products: products,
//                     );
//                   },
//                 ),
//               );
//             },
//             icon: const Icon(
//               Icons.add,
//             ),
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const SizedBox(
//               height: 100,
//               child: DrawerHeader(
//                 decoration: BoxDecoration(color: cl),
//                 child: Text(
//                   'Menu',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             ListTile(
//               title: const Text('Home'),
//               onTap: () {},
//             ),
//             ListTile(
//               title: const Text('Đăng xuất'),
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         ),
//       ),
//       // body: ListView.builder(
//       //   itemCount: products.length,
//       //   itemBuilder: (context, index) {
//       //     final product = products[index];
//       //     return ListTile(
//       //       leading: Image.asset(product.image),
//       //       title: Text(product.ten),
//       //       subtitle: Text('ID: ${product.id}'),
//       //     );
//       //   },
//       // ),
//       body: ListView.custom(
//         childrenDelegate: SliverChildBuilderDelegate(
//           (context, index) {
//             final product = products[index];
//             return _sanpham(
//                 product.ten, product.image, product.mota, product.price);
//           },
//           childCount: products.length,
//         ),
//       ),
//     );
//   }
// }

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
                color: cl,
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

class AddProductScreen extends StatefulWidget {
  final List<Product> products;
  const AddProductScreen({super.key, required this.products}); //

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        backgroundColor: cl,
        actions: [
          IconButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                String name = _nameController.text;
                String description = _descriptionController.text;
                double price = double.parse(_priceController.text);
                String image = _imageController.text;

                Product newProduct = Product(
                    ten: name, image: image, mota: description, price: price);
                setState(() {
                  widget.products.add(newProduct);
                });
                _nameController.clear();
                _descriptionController.clear();
                _priceController.clear();
                _imageController.clear();

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return DanhSachSanpham(
                        products: products,
                      );
                    },
                  ),
                );
              }
            },
            icon: const Icon(
              Icons.save,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Tên sản phẩm'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tên sản phẩm';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Giá sản phẩm'),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập giá sản phẩm';
                  }
                  try {
                    double.parse(value);
                  } catch (error) {
                    return 'Giá sản phẩm không hợp lệ';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Mô tả sản phẩm'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mô tả sản phẩm';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageController,
                decoration: const InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập đường dẫn ảnh';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
