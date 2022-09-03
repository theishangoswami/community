import 'package:community_internal/ui/onboarding/login_page.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class ReferalInput extends StatefulWidget {
  const ReferalInput({Key? key}) : super(key: key);

  @override
  State<ReferalInput> createState() => _ReferalInputState();
}

class _ReferalInputState extends State<ReferalInput> {
  String? _refferalCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/friend.png"),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  "Your Referral Code",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                "Enter Referral Code",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: Center(
                  child: OTPTextField(
                    length: 6,
                    keyboardType: TextInputType.text,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 50,
                    fieldStyle: FieldStyle.underline,
                    outlineBorderRadius: 15,
                    style: const TextStyle(fontSize: 17),
                    onCompleted: (pin) {
                      _refferalCode = pin;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 55,
                width: 121,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 2),
                  child: RaisedButton(
                    color: Colors.amber,
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(
                            isrefferal: true,
                            refferalCode: _refferalCode,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
