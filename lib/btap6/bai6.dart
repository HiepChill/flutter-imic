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
          title: const Text('MyShop'),
          backgroundColor: Colors.purple,
          actions: [
            IconButton(
              onPressed: () {

              }, 
              icon: Icon(Icons.settings)
            ),

            Padding(
              padding: EdgeInsets.only(top: 8 , right: 10),
              child: Badge(
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {

                  },
                ),
              ),
            )

          ],
        ),
        drawer: Drawer(
          
        ),
        body: ListProduct()
        ),
      );
  }
}


class ListProduct extends StatelessWidget {
  const ListProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage('assets/images/af1.png'),
                  fit: BoxFit.cover,
                )
              ),
              
          
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0 , right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {}, 
                          icon: Icon(Icons.favorite),
                          color: Colors.purple,
                        ),
                  
                        Text('San pham 1'),
                  
                        IconButton(
                          onPressed: () {}, 
                          icon: Icon(Icons.shopping_cart),
                          color: Colors.purple,
                        )
                      ],
                    ),
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}