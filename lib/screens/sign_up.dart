import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev show log;

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isLogin = true;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _username;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _username = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        title: const Text(
          "Register",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: _username,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  labelText: 'Email Address',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _password,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.password,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final email = _email.text;
                  final password = _password.text;
                  // try {
                    final userCredential =
                        await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    dev.log(userCredential.toString());
                  // } 
                  // on FirebaseAuthException catch (e) {
                  // } catch (e) {}
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.resolveWith(
                    (states) => const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                  ),
                  maximumSize: MaterialStateProperty.resolveWith(
                      (states) => Size.infinite),
                  shape: MaterialStateProperty.resolveWith(
                    (states) => RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.teal),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
