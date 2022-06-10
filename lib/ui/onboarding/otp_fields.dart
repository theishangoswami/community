import 'package:community_internal/ui/onboarding/otp_text_fields.dart';
import 'package:flutter/material.dart';

class OTPFields extends StatefulWidget {
  const OTPFields({
    Key? key,
  }) : super(key: key);

  @override
  State<OTPFields> createState() => _OTPFieldsState();
}

class _OTPFieldsState extends State<OTPFields> {
  /// Increase the controller if you needs more field, but beware that
  /// you need to dispose them as well, otherwise memory leak will happen
  late TextEditingController _controller1;
  late TextEditingController _controller2;
  late TextEditingController _controller3;
  late TextEditingController _controller4;

  /* <----  -----> */
  void _shiftToNextField(TextEditingController controller) {
    setState(() {});
    if (controller.text.isNotEmpty) {
      FocusScope.of(context).nextFocus();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
    _controller3 = TextEditingController();
    _controller4 = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
  }

  final InputDecoration _decoration = InputDecoration(
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    border: InputBorder.none,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: _controller1.text == ''
                          ? Colors.transparent
                          : Colors.black),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 5.0,
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    _controller1.text.isNotEmpty
                        ? Center(
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                color: Colors.black,
                              ),
                            ),
                          )
                        : Container(),
                    Center(
                      child: OTPTextField(
                        onChanged: () => _shiftToNextField(_controller1),
                        controller: _controller1,
                        decoration: _decoration,
                        autofocus: true,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: _controller2.text == ''
                          ? Colors.transparent
                          : Colors.black),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 5.0,
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    _controller2.text.isNotEmpty
                        ? Center(
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                color: Colors.black,
                              ),
                            ),
                          )
                        : Container(),
                    Center(
                      child: OTPTextField(
                        onChanged: () => _shiftToNextField(_controller2),
                        controller: _controller2,
                        decoration: _decoration,
                        autofocus: true,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: _controller3.text == ''
                          ? Colors.transparent
                          : Colors.black),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 5.0,
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    _controller3.text.isNotEmpty
                        ? Center(
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                color: Colors.black,
                              ),
                            ),
                          )
                        : Container(),
                    Center(
                      child: OTPTextField(
                        onChanged: () => _shiftToNextField(_controller3),
                        controller: _controller3,
                        decoration: _decoration,
                        autofocus: true,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: _controller4.text == ''
                          ? Colors.transparent
                          : Colors.black),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 5.0,
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    _controller4.text.isNotEmpty
                        ? Center(
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                color: Colors.black,
                              ),
                            ),
                          )
                        : Container(),
                    Center(
                      child: OTPTextField(
                        onChanged: () => _shiftToNextField(_controller4),
                        controller: _controller4,
                        decoration: _decoration,
                        autofocus: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
