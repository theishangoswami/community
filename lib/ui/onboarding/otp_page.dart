import 'package:community_internal/app/locator.dart';
import 'package:community_internal/core/repository/auth.repository.dart';
import 'package:community_internal/core/services/key_storage.service.dart';
import 'package:community_internal/main.dart';
import 'package:community_internal/ui/screens/community_list.dart';
import 'package:community_internal/ui/screens/onboarding_screen.dart';
import 'package:community_internal/ui/screens/settings%20module/user.dart';
import 'package:community_internal/ui/screens/verification_ui.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CodeVerificationPage extends StatefulWidget {
  final String phonenumber;
  const CodeVerificationPage({Key? key, required this.phonenumber})
      : super(key: key);

  @override
  State<CodeVerificationPage> createState() => _CodeVerificationPageState();
}

class _CodeVerificationPageState extends State<CodeVerificationPage> {
  bool isBusy = false;
  @override
  Widget build(BuildContext context) {
    return LoadingHelper(
      isLoading: isBusy,
      child: Scaffold(
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
              OtpInput(
                phoneNumber: widget.phonenumber,
                isBusy: isBusy,
                setBusy: (value) {
                  setState(() {
                    isBusy = value;
                  });
                },
              ),
              const Spacer(flex: 5),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Need Help?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtpInput extends StatefulWidget {
  final bool isBusy;
  final String phoneNumber;
  final Function(bool value) setBusy;
  const OtpInput({
    Key? key,
    required this.isBusy,
    required this.setBusy,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  String pincode = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: PinCodeTextField(
              onChanged: (value) {
                setState(() {
                  pincode = value;
                });
              },
              enableActiveFill: true,
              boxShadows: const [
                BoxShadow(color: Colors.black12, blurRadius: 8)
              ],
              obscureText: true,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              length: 6,
              pinTheme: PinTheme(
                fieldOuterPadding: const EdgeInsets.only(left: 8),
                selectedColor: Theme.of(context).primaryColor,
                inactiveColor: Colors.white,
                activeFillColor: Colors.white,
                selectedFillColor: Colors.white,
                activeColor: Colors.white,
                shape: PinCodeFieldShape.box,
                fieldWidth: 40,
                inactiveFillColor: Colors.white,
                borderRadius: BorderRadius.circular(6),
                disabledColor: Colors.white,
              ),
              appContext: context,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: ElevatedButton(
              onPressed: () async {
                if (pincode.length == 6) {
                  widget.setBusy(true);
                  bool res = await AuthRepository()
                      .verifyOtp(widget.phoneNumber, pincode);
                  if (res) {
                    await StorageService().saveUser(widget.phoneNumber);
                  }
                  widget.setBusy(false);
                  if (res) {
                    final user = StorageService().getCurrentUser();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => user?.status?.startsWith('e') ??
                                false
                            ? user?.societyId?.isNotEmpty ?? false
                                ? MyHomePage(
                                    societyId: user!.societyId!,
                                    societyName: locator<SharedPreferences>()
                                            .getString('societyName') ??
                                        '',
                                  )
                                : const CommunityList()
                            : user?.registrationDate == null
                                ? UserDetails(phoneNumber: widget.phoneNumber)
                                : VerifyPage(
                                    phonenumber: widget.phoneNumber,
                                  ),
                      ),
                    );
                  }
                }
              },
              child: const Text(
                'VERIFICATION',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
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
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
