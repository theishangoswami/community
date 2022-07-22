import 'package:community_internal/core/repository/auth.repository.dart';
import 'package:community_internal/ui/onboarding/otp_page.dart';
import 'package:community_internal/ui/screens/Invitation/referal_code.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:flutter/services.dart';
int count=1;
class LoginForm extends StatefulWidget {
  final bool isBusy;
  final Function(bool value) setBusy;
  const LoginForm({
    Key? key,
    required this.isBusy,
    required this.setBusy,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _mobileNumberController;
  final GlobalKey<FormState> formKey = GlobalKey();
  final AuthRepository _authRepository = AuthRepository();
  bool isBusy = false;
  @override
  void initState() {
    super.initState();
    _mobileNumberController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _mobileNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
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
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
              ),
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  String text = (value ?? "").trim();
                  if (text.isEmpty) {
                    return "Please enter your mobile number";
                  } else if (text.length != 10) {
                    return "Please enter a valid mobile number";
                  }
                  return null;
                },
                controller: _mobileNumberController,
                decoration: const InputDecoration(
                  prefix: Text('India (+91)  '),
                  hintText: 'ENTER PHONE NUMBER',
                  prefixStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  suffixIconConstraints: BoxConstraints(maxHeight: 24),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text(
              'OTP WILL SENT TO YOUR REGISTER MOBILE NUMBER',
              style: TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState?.validate() ?? false) {
                    widget.setBusy(true);
                    bool res = await _authRepository.sendOtp(
                      (_mobileNumberController.text),
                    );
                    widget.setBusy(false);

                    if (res) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CodeVerificationPage(
                            phonenumber: _mobileNumberController.text.trim(),
                          ),
                        ),
                      );
                    }
                  }
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
            Padding(
              padding: const EdgeInsets.all(5),
              child: GestureDetector(
                onTap:(){
                  setState((){
                    count=2;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>Page2()
                    ),
                  );
                },
                child: count==1?Text(
                  'Have an Referral Code?',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ):Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



