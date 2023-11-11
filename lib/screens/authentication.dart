import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _isLoggedIn = false;
  var _email = '';
  var _password = '';
  var _username = '';
  final _formKey = GlobalKey<FormState>();

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
            fontSize: 26,
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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 30),
                if (!_isLoggedIn)
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter a username";
                      }
                      if (!value[0].toLowerCase().contains(RegExp(r'[a-z]'))) {
                        return "The username must begin with a lowercase character";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      _username = value!;
                    },
                    key: const ValueKey('username'),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter an email address";
                    }
                    if (!value.contains('@')) {
                      return "Enter a valid email address";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                  key: const ValueKey('email'),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a password";
                    }
                    if (!value.toUpperCase().contains(RegExp(r'[A-Z]'))) {
                      return "The password must contain an uppercase character";
                    }
                    if (value.length < 8) {
                      return "The length of the password must be more than 8 characters";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                  key: const ValueKey('password'),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: _isLoggedIn
                        ? const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : const Text(
                            "Sign up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isLoggedIn = !_isLoggedIn;
                    });
                  },
                  child: _isLoggedIn
                      ? Text(
                          "Sign up here!",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      : Text(
                          "Login here",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
