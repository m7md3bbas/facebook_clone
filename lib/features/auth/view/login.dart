import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => null,
          icon: const Icon(FontAwesomeIcons.arrowLeft),
        ),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('English'),
                  Icon(Icons.arrow_drop_down, size: 30),
                ],
              ),
            ),
            Icon(FontAwesomeIcons.facebook, color: Colors.blue, size: 50),
            Column(
              spacing: 20,
              children: [
                TextFormField(controller: _emailController),
                TextFormField(controller: _passwordController),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {},
                  child: const Text('Login'),
                ),

                TextButton(onPressed: () {}, child: Text('Forgot Password?')),
              ],
            ),
            TextButton(onPressed: () {}, child: Text('Create Account')),
          ],
        ),
      ),
    );
  }
}
