import 'package:complex_data_management/auth/user_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordHidden = true;
  String _error = '';

  void login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username == 'aslam' && password == '123456') {
      UserAuth.isLoggedIn = true;
      context.go('/home');
    } else {
      setState(() {
        _error = 'Invalid Username and Password';
        _usernameController.clear();
        _passwordController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Username',
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: _isPasswordHidden,
              obscuringCharacter: '#',
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordHidden = !_isPasswordHidden;
                    });
                  },
                  icon: Icon(
                    _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  login();
                },
                child: Text('Login'),
              ),
            ),
            if (_error.isNotEmpty) Text(_error),
          ],
        ),
      ),
    );
  }
}
