import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 100,left: 20,right: 20),
          child: Column(
            children: [
              Image.asset("assets/images/friend.png"),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 20),
                child: Text("Your Referral Code",style: TextStyle(fontSize: 32,fontWeight:FontWeight.bold )),
              ),
              Text("Enter Referral Code",style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold )),
              Container(
                height: 40,
                width: double.infinity,
                child:Center(
                  child: OTPTextField(
                      length: 4,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldWidth: 50,
                      fieldStyle: FieldStyle.underline,
                      outlineBorderRadius: 15,
                      style: TextStyle(fontSize: 17),
                      onChanged: (pin) {
                      },
                      onCompleted: (pin) {
                      }),
                ),
              ),
              SizedBox(
                height: 55,
                width: 121,
                child:
                    Padding(
                      padding: const EdgeInsets.only(top: 20,left: 2),
                      child: RaisedButton(
                          color: Color(0xFF5A3FCE),
                          child: Row(
                            children: [
                              Icon(Icons.next_plan,size: 17,),
                              SizedBox(
                                width: 11,
                              ),
                              Text("Proceed",style:TextStyle(color:Colors.black,fontSize: 16)),
                            ],
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }
                      ),
                    )
                )
            ],
          ),
        )
    );
  }
}