import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class ReferalInput extends StatefulWidget {
  const ReferalInput({Key? key}) : super(key: key);

  @override
  State<ReferalInput> createState() => _ReferalInputState();
}

class _ReferalInputState extends State<ReferalInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            children: [
              Image.asset("assets/images/friend.png"),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text("Your Referral Code",
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              ),
              Text("Enter Referral Code",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: double.infinity,
                child: Center(
                  child: OTPTextField(
                      length: 4,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldWidth: 50,
                      fieldStyle: FieldStyle.underline,
                      outlineBorderRadius: 15,
                      style: TextStyle(fontSize: 17),
                      onChanged: (pin) {},
                      onCompleted: (pin) {}),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 55,
                  width: 121,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 2),
                    child: RaisedButton(
                        color: Colors.amber,
                        child: Text("Continue",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ))
            ],
          ),
        ));
  }
}
