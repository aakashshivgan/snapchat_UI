import 'package:flutter/material.dart';
import 'package:snapchat_ui/widgets/signup_login_btn.dart';
import 'package:snapchat_ui/widgets/txt_fields.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();
  String error = "";
  String email = "";
  String password = "";
  String username = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 40),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 30,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    feildOnScreen(),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              signUpButton(),
            ],
          ),
        ),
      ),
    );
  }

  feildOnScreen() {
    return Container(
      child: Column(
        children: [
          const Text(
            "Sign Up",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 25,
                fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFieldsForScreen(
                label: "Username",
                txtType: TextInputType.name,
                validator: (val) =>
                    val.length < 2 ? "Minimum 2 characters are needed" : null,
                onChange: (val) {
                  setState(() {
                    username = val;
                  });
                },
                obscure: false),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFieldsForScreen(
                label: "Email",
                txtType: TextInputType.emailAddress,
                validator: (val) => val.isEmpty ? "Enter an email" : null,
                onChange: (val) {
                  setState(() {
                    email = val;
                  });
                },
                obscure: false),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFieldsForScreen(
                label: "Password",
                txtType: TextInputType.visiblePassword,
                validator: (val) => val.length < 6
                    ? "Password should be more than 6 characters"
                    : null,
                onChange: (val) {
                  setState(() {
                    password = val;
                  });
                },
                obscure: true),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 35,
              right: 35,
            ),
            child: RichText(
              text: const TextSpan(
                text:
                    "By tapping Sign Up & Accept you acknowledge that you have read the ",
                style: TextStyle(color: Colors.black45, fontSize: 14),
                children: [
                  TextSpan(
                    text: "Privacy policy ",
                    style: TextStyle(color: Colors.blue),
                  ),
                  TextSpan(
                    text: "and agree to the ",
                    style: TextStyle(color: Colors.black45),
                  ),
                  TextSpan(
                    text: "Terms & Conditions ",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  signUpButton() {
    return Column(
      children: [
        SignupLoginBtn(
            color: Colors.blue,
            onPress: () {
              if (_formkey.currentState!.validate()) ;
            },
            text: "Sign Up & Accept")
      ],
    );
  }
}
