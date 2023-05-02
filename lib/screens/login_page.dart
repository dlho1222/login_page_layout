import 'package:flutter/material.dart';
import 'package:login_page/screens/auth_page.dart';
import 'package:login_page/widgets/social_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isRegister = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(width: 0, color: Colors.transparent),
  );
  final Duration _duration = const Duration(milliseconds: 400);
  final Curve _curve = Curves.fastOutSlowIn;
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _PassWordController = TextEditingController();
  final TextEditingController _CheckPassWordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.gif'), fit: BoxFit.fill)),
        child: Form(
          key: _formKey,
          child: ListView(
            reverse: true,
            padding: const EdgeInsets.all(16),
            children: [
              CircleAvatar(
                child: Image.asset('assets/profile.png'),
                radius: 36,
              ),
              const SizedBox(
                height: 16,
              ),
              ButtonBar(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isRegister = false;
                      });
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: isRegister ? Colors.black54 : Colors.black,
                          fontSize: 16,
                          fontWeight:
                              isRegister ? FontWeight.w400 : FontWeight.w600),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isRegister = true;
                        });
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: isRegister ? Colors.black : Colors.black54,
                            fontSize: 16,
                            fontWeight:
                                isRegister ? FontWeight.w600 : FontWeight.w400),
                      ))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              EditText('Email Address', _EmailController),
              const SizedBox(
                height: 16,
              ),
              EditText('PassWord', _PassWordController),
              const SizedBox(
                height: 16,
              ),
              AnimatedContainer(
                  height: isRegister ? 60 : 0,
                  duration: _duration,
                  curve: _curve,
                  child: EditText('CheckPassWord', _CheckPassWordController)),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white54,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AuthPage(),
                          ));
                    }
                  },
                  child: const Text(
                    'Login',
                  )),
              const Divider(
                thickness: 1,
                color: Colors.white,
                height: 32,
              ),
              const SizedBox(
                height: 16,
              ),
              const ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  SocialButton(
                    imagePath: 'assets/google_logo_icon.png',
                  ),
                  SocialButton(
                    imagePath: 'assets/apple_logo_icon.png',
                  ),
                  SocialButton(
                    imagePath: 'assets/facebook_logo_icon.png',
                  ),
                ],
              ),
            ].reversed.toList(),
          ),
        ),
      ),
    );
  }

  TextFormField EditText(String labelText, TextEditingController controller) {
    return TextFormField(
      validator: (text) {
        if (controller != _CheckPassWordController &&
            (text == null || text.isEmpty)) {
          return '입력창이 비어있습니다.';
        }
        if (controller == _CheckPassWordController &&
            isRegister &&
            (text == null || text.isEmpty)) {
          return '비밀번호를 확인해 주세요';
        }

        return null;
      },
      cursorColor: Colors.white,
      decoration: InputDecoration(
          fillColor: Colors.black54,
          filled: true,
          enabledBorder: _border,
          border: _border,
          focusedBorder: _border,
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          labelText: labelText),
      style: const TextStyle(color: Colors.white),
      controller: controller,
    );
  }
}
