import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _pssswordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Signup',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => const Loginpage()));
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 20,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 55, 154, 156),
      ),
      backgroundColor: Color.fromARGB(255, 55, 154, 156),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'asset/signup.jpg',
                width: 300,
                height: 300,
              ),
            ),
            //Text
            const Expanded(
              child: Text(
                "'Let's GO'",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            Column(
              children: [
                TextFormField(
                  controller: _usernameController,
                  style: const TextStyle(fontSize: 15),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    hintText: 'Username',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _emailController,
                  style: TextStyle(fontSize: 15),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    hintText: 'Email',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                // ignore: avoid_print

                TextFormField(
                  controller: _pssswordController,
                  style: TextStyle(fontSize: 15),
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    hintText: 'password',
                    prefixIcon: Icon(
                      Icons.key,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _confirmpasswordController,
                  style: TextStyle(fontSize: 15),
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    hintText: 'Confirmpassword',
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _pssswordController.text)
                        .then((value) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => Home()));
                    }).onError((error, stackTrace) {
                      print('error');
                    });
                  },
                  child: Text('            Submit           '),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ], //                                           \\FOCUS//
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
