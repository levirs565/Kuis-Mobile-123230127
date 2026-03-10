import 'package:flutter/material.dart';
import 'package:kuis/repository/auth.dart';

class ProfilePage extends StatelessWidget {
  static createRoute() => MaterialPageRoute(builder: (context) => ProfilePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Text(
            "Selemat datang ${AuthRepository.getUser()}",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }

}