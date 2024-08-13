import 'package:flutter/material.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Continue with E-mail',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          leading: GestureDetector(
            onTap: () => {
              Navigator.pop(context)
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 15,
            ),
          ),
        ),
        body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: UnderlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(
                              value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: UnderlineInputBorder(),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 5.0),
                      GestureDetector(
                        onTap: () {  },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text("I forgot my password", style: TextStyle(
                            fontSize: 10.0,
                            color: Color(0xFF686873)
                          ),),
                        ),
                      ),
                      SizedBox(height: 35.0),
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF3843FF)),
                        ),
                        onPressed: () { },
                        child: Text('Don’t have account? Let’s create!', style: TextStyle(
                          fontSize: 10.0
                        ),),
                      ),
                      SizedBox(height: 5.0),
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:  MaterialStateProperty.all<Color>(Color(0xFF3843FF)),
                        ),
                        onPressed: () { _submitForm();},
                        child: Text('Next'),
                      )
                    ],
                  ),
                ),),
            ]
        ));
  }}
