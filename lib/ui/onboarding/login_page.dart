import 'package:community_internal/ui/onboarding/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loginForm = LoginForm;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: const [
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'COMMUNITY APP',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
            Spacer(),
            LoginForm(),
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
    );
  }
}
