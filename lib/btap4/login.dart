import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(const MyApp());

const _priorityColor = Colors.purple;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: Scaffold(
        body: LoginForm()
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _HomePageState();
}

class _HomePageState extends State<LoginForm> {
  var _loginCheck = true; 
  var _signupCheck = false;

  void _switch2 () {
    if (_signupCheck) {
      setState(() {
        _signupCheck = false;
        _loginCheck = true;
      });
    } else {
      _signupCheck = true;
      _loginCheck = false;
    }
  }

  void _switch1 () {
    if (_loginCheck) {
      setState(() {
        _loginCheck = false;
        _signupCheck = true;
      });
    } else {
      _loginCheck = true;
      _signupCheck = false;
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(239, 236, 67, 124),
              Color.fromARGB(255, 224, 181, 115),
            ]
          )
        ),

        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.rotate(
                  alignment: Alignment.center,
                  angle: -math.pi / 50,
                  child: Container(
                    width: 370,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.red[900],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20)
                      )
                    ),
                    child: const Center(
                      child: Text(
                        'MyShop',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    )
                  ),
                ),

                Form(
                  key: _formKey,
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.all(15),
                    width: 250,
                    height: 380,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        
                        TextFormField(
                          autofocus: true,
                          decoration: const InputDecoration(
                            hintText: 'E-Mail',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng điền thông tin!';
                            }
                            return null;
                          }
                        ),

                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Password'
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng điền mật khẩu';
                            } 
                            return null;
                          },
                        ),

                        if (_signupCheck)
                          TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Confirm Password'
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng điền mật khẩu';
                            } 
                            return null;
                          },
                        ),

                        if (_loginCheck)
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _priorityColor,
                              ),
                              child: const Text(
                              'LOGIN'
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Processing Data')),
                                  );
                                }
                              } 
                            ),
                          ),

                        if (_signupCheck)
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _priorityColor,
                              ),
                              child: const Text(
                              'SIGN UP'
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Processing Data')),
                                  );
                                }
                              } 
                            ),
                          ),

                        if (_loginCheck)
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextButton(
                              child: const Text(
                                'SIGNUP INSTEAD',
                                style: TextStyle(
                                  color: _priorityColor,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _switch1();
                                });
                              },
                            ),
                          ),

                        if (_signupCheck)
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextButton(
                              child: const Text(
                                'LOGIN INSTEAD',
                                style: TextStyle(
                                  color: _priorityColor,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _switch2();
                                });
                              },
                            ),
                          )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}