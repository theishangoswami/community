import 'package:community_internal/ui/onboarding/otp_fields.dart';
import 'package:community_internal/ui/screens/community_list.dart';
import 'package:community_internal/ui/screens/onboarding_screen.dart';
import 'package:community_internal/ui/screens/user_details.dart';
import 'package:flutter/material.dart';

class CodeVerificationPage extends StatelessWidget {
  const CodeVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'OTP VERIFICATION',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
            const Spacer(),
            const OtpInput(),
            const Spacer(flex: 5),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Need Help?',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OtpInput extends StatelessWidget {
  const OtpInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: const OTPFields(),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserDetails(),
                  ),
                );
              },
              child: const Text(
                'VERIFICATION',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Didn\'t recieve the code?'),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Re-send (32)',
                  style: Theme.of(context).textTheme.button?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
