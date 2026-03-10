import 'package:flutter/material.dart';
import 'package:kuis/repository/auth.dart';
import 'package:kuis/screen/home.dart';

class LoginPage extends StatefulWidget {
  static createRoute() => MaterialPageRoute(builder: (context) => LoginPage());

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              Image.asset("assets/upnLogo.png", width: 128),
              Text("Login", style: Theme.of(context).textTheme.titleLarge,),
              Text("Login untuk mengakses lebih banyak fitur"),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Username"),
                  prefixIcon: Icon(Icons.person)
                ),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Password"),
                  prefixIcon: Icon(Icons.lock)
                ),
                obscureText: true,
              ),
              FilledButton(onPressed: _onLoginPressed, child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }

  void _onLoginPressed() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (!AuthRepository.login(username, password)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Gagal login")));
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Login berhasil")));
    Navigator.of(context).pushReplacement(HomePage.createRoute());
  }
}
