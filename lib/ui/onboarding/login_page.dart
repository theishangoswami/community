import 'package:community_internal/ui/onboarding/login_form.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isBusy = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LoadingHelper(
        isLoading: isBusy,
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(),
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'COMMUNITY APP',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5A3FCE),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              LoginForm(
                isBusy: isBusy,
                setBusy: (value) {
                  setState(() {
                    isBusy = value;
                  });
                },
              ),
              // SignInButtons(
              //   onSignIn: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const EntryPointUI()));
              //   },
              //   onSignupWithFacebook: () {},
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
