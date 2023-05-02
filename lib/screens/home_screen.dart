import 'package:flutter/material.dart';
import 'package:login_page/screens/login_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              icon: Icon(Icons.login))
        ],
        centerTitle: true,
        title: Text('HomeScreen'),
        foregroundColor: Colors.blue,
        backgroundColor: Colors.tealAccent,
      ),
    );
  }
}
