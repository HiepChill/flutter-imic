import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
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
      )
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
      child: Padding(
        padding: const EdgeInsets.only(left: 20 , right: 20),
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
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Price'
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please provide a value!';
                      }
                      return null;
                    }
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Description'
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please provide a value!';
                      }
                      return null;
                    }
                  ),

                  IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5), 
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black
                                  )
                                ),
                                child: Text(
                                  'Enter a URL'
                                ),
                              ),
                            )
                          ),

                          Expanded(
                            flex: 5,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Image URL'
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please provide a value!';
                                }
                                return null;
                              }
                            )
                          )
                        ]
                      )
                    ),
                  ),

                  ElevatedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    } 
                  )
                ],  
              )
                
            ),
          ),
        ),
      ),
    );
  }
}