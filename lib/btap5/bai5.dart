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
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20 , right: 20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  )
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://lh4.googleusercontent.com/1uAMz4cpRWB2wxBoK4PaX3l1IvDSW0yYDgttbwaH1FPkbK2jo37lzPdGxyq9ngzrf-jsci4YvRLH1Ws=w1792-h950'
                            )
                          )
                        ),
                      ),

                      const Text(
                        'Demo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      IconButton(
                        onPressed: () {}, 
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.purple,
                        ),
                      ),

                      IconButton(
                        onPressed: () {}, 
                        icon: const Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 240, 24, 8),
                        ),
                      )
                    ],
                  )
                  
                ],
              )
            ),

            Container(
              padding: const EdgeInsets.only(left: 20 , right: 20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  )
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://lh4.googleusercontent.com/1uAMz4cpRWB2wxBoK4PaX3l1IvDSW0yYDgttbwaH1FPkbK2jo37lzPdGxyq9ngzrf-jsci4YvRLH1Ws=w1792-h950'
                            )
                          )
                        ),
                      ),

                      const Text(
                        'product 2',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      IconButton(
                        onPressed: () {}, 
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.purple,
                        ),
                      ),

                      IconButton(
                        onPressed: () {}, 
                        icon: const Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 240, 24, 8),
                        ),
                      )
                    ],
                  )
                  
                ],
              )
            ),

            Container(
              padding: const EdgeInsets.only(left: 20 , right: 20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  )
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://lh4.googleusercontent.com/1uAMz4cpRWB2wxBoK4PaX3l1IvDSW0yYDgttbwaH1FPkbK2jo37lzPdGxyq9ngzrf-jsci4YvRLH1Ws=w1792-h950'
                            )
                          )
                        ),
                      ),

                      const Text(
                        'Áo thun',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      IconButton(
                        onPressed: () {}, 
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.purple,
                        ),
                      ),

                      IconButton(
                        onPressed: () {}, 
                        icon: const Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 240, 24, 8),
                        ),
                      )
                    ],
                  )
                  
                ],
              )
            )
          ],
        ),
      ),
    );
  }
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