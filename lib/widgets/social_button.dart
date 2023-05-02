import 'package:flutter/material.dart';
import 'package:login_page/screens/auth_page.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.imagePath,
  });
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white54, borderRadius: BorderRadius.circular(25)),
      child: IconButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AuthPage(),
              ));
        },
        icon: Image.asset(imagePath),
      ),
    );
  }
}
