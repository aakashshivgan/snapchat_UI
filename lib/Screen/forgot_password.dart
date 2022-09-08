import 'package:flutter/material.dart';
import 'package:snapchat_ui/widgets/signup_login_btn.dart';
import 'package:snapchat_ui/widgets/txt_fields.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Container(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    "Enter your email",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFieldsForScreen(
                        label: "Email",
                        txtType: TextInputType.emailAddress,
                        onChange: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                        validator: ((val) =>
                            val.isempty ? "Enter an email" : null),
                        obscure: false),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    error,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SignupLoginBtn(
              color: Colors.blue,
              onPress: () async {
                if (_formKey.currentState!.validate()) ;
              },
              text: "Submit")
        ],
      ),
    ));
  }
}
