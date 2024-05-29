import 'package:flutter/material.dart';

class PLAMATLogin extends StatelessWidget {
  const PLAMATLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(210, 180, 17, 17),
            height: 400,
            child: const Center(
              child: Icon(
                Icons.lock,
                size: 100,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: MediaQuery.of(context).size.height - 300,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Application Form Log-in',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 236, 183, 23)),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Use the account credentials that are sent to your email',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    SizedBox(height: 30),
                    LoginForm(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() == true) {
                print('Email: ${_emailController.text}');
                print('Password: ${_passwordController.text}');
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(210, 180, 17, 17),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Text('View Application Form'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // Change background to white
              side: const BorderSide(
                  color:
                  Color.fromARGB(210, 180, 17, 17)), // Add red border
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(
                  fontSize: 14, color: Color.fromARGB(210, 180, 17, 17)),
            ),
          ),
        ],
      ),
    );
  }
}
