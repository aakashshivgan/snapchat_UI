import 'package:flutter/material.dart';
import 'package:snapchat_ui/Screen/forgot_password.dart';
import 'package:snapchat_ui/widgets/signup_login_btn.dart';
import 'package:snapchat_ui/widgets/txt_fields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 40),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        child: Column(
                          children: [fieldsOnScreen()],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    SignupLoginBtn(
                        color: Colors.blue,
                        onPress: () async {
                          if (_formKey.currentState!.validate()) {}
                        },
                        text: "LOG IN")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  fieldsOnScreen() {
    return Container(
      child: Column(children: [
        const Text(
          "LOG IN",
          style: TextStyle(
              color: Colors.black87, fontSize: 24, fontWeight: FontWeight.w700),
        ),
        TextFieldsForScreen(
          label: "Email",
          txtType: TextInputType.emailAddress,
          obscure: false,
          validator: (val) => val.isEmpty ? "Enter a email" : null,
          onChange: (val) {
            setState(() {
              email = val;
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        TextFieldsForScreen(
          label: "Password",
          txtType: TextInputType.visiblePassword,
          obscure: true,
          validator: (val) =>
              val.length < 6 ? "Password must be 6+ characters" : null,
          onChange: (val) {
            setState(() {
              password = val;
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen()));
            }),
            child: const Text(
              "Forgot Password?",
              style: TextStyle(color: Colors.blue),
            )),
      ]),
    );
  }
}
