import 'package:community_internal/ui/onboarding/otp_page.dart';
import 'package:community_internal/ui/screens/community_list.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4.0,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                  prefixText: 'India (+91)  ',
                  hintText: 'ENTER PHONE NUMBER',
                  prefixStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                  suffixIconConstraints: BoxConstraints(maxHeight: 24)),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const Text(
            'OTP WILL SENT TO YOUR REGISTER MOBILE NUMBER',
            style: TextStyle(
                color: Colors.grey, decoration: TextDecoration.underline),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CodeVerificationPage(),
                  ),
                );
              },
              child: Text(
                'CONTINUE',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
