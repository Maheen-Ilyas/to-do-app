import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
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
            ],
          ),
        ),
      ),
    );
  }
}
