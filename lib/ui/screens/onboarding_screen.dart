import 'package:community_internal/ui/screens/community_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/input_decoration.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _aadharNumberController = TextEditingController();
  final TextEditingController _casteController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _inviteCodeController = TextEditingController();

  final GlobalKey<FormState>? _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Onboarding'.toUpperCase(),
      //     style: const TextStyle(fontSize: 22),
      //   ),
      // ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      "Share your details".toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(12.0),
                    //   child: TextFormField(
                    //     validator: (value) {
                    //       return value!.isEmpty
                    //           ? "Please enter an email".toUpperCase()
                    //           : null;
                    //     },
                    //     controller: _emailController,
                    //     decoration: buildInputDecoration(
                    //       "Email".toUpperCase(),
                    //       "hello@gmail.com",
                    //       Icon(Icons.email_sharp),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        validator: (value) {
                          return value!.isEmpty
                              ? "Please enter a name".toUpperCase()
                              : null;
                        },
                        controller: _nameController,
                        decoration: buildInputDecoration(
                          "Name".toUpperCase(),
                          "Praveen Varma",
                          const Icon(Icons.drive_file_rename_outline),
                        ),
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     SizedBox(
                    //       width: MediaQuery.of(context).size.width * 0.5,
                    //       height: 40,
                    //       child: TextFormField(
                    //         validator: (value) {
                    //           return value!.length != 10
                    //               ? "Please enter a valid phone"
                    //               : null;
                    //         },
                    //         controller: _mobileNumberController,
                    //         decoration: buildInputDecoration(
                    //           "Phone".toUpperCase(),
                    //           "1234567890",
                    //           Icon(Icons.phone),
                    //         ),
                    //         keyboardType: TextInputType.phone,
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: MediaQuery.of(context).size.width * 0.3,
                    //       height: 40,
                    //       child: TextFormField(
                    //         validator: (value) {
                    //           return value!.isEmpty
                    //               ? "Please enter your gender".toUpperCase()
                    //               : null;
                    //         },
                    //         controller: _genderController,
                    //         decoration: buildInputDecoration(
                    //             "M/F".toUpperCase(),
                    //             "M",
                    //             Icon(
                    //               Icons.male_sharp,
                    //             )),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        validator: (value) {
                          return value!.isEmpty
                              ? "Please enter a valid address".toUpperCase()
                              : null;
                        },
                        controller: _addressController,
                        decoration: buildInputDecoration(
                            "Date of birth".toUpperCase(),
                            "03/02/2001",
                            const Icon(
                              FontAwesomeIcons.calendarWeek,
                            ),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        validator: (value) {
                          return value!.isEmpty
                              ? "Please enter a valid aadhar ID".toUpperCase()
                              : null;
                        },
                        controller: _aadharNumberController,
                        decoration: buildInputDecoration(
                          "Aadhaar".toUpperCase(),
                          "1234 5678 9321",
                          const Icon(
                            FontAwesomeIcons.fingerprint,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        validator: (value) {
                          return value!.isEmpty
                              ? "Please enter a valid aadhar ID".toUpperCase()
                              : null;
                        },
                        controller: _aadharNumberController,
                        decoration: buildInputDecoration(
                          "Passport Number".toUpperCase(),
                          "1234 5678 9321",
                          const Icon(
                            FontAwesomeIcons.addressCard,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        validator: (value) {
                          return value!.isEmpty
                              ? "Please enter your caste".toUpperCase()
                              : null;
                        },
                        controller: _casteController,
                        decoration: buildInputDecoration(
                          "Caste".toUpperCase(),
                          "Kshatriya",
                          const Icon(Icons.group),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        validator: (value) {
                          return value!.isEmpty
                              ? "Please enter your location".toUpperCase()
                              : null;
                        },
                        controller: _casteController,
                        decoration: buildInputDecoration(
                          "Location".toUpperCase(),
                          "Delhi",
                          const Icon(
                            Icons.pin_drop_sharp,
                          ),
                        ),
                      ),
                    ),
                    // DropdownButtonFormField<String>(
                    //   isDense: false,
                    //   isExpanded: true,
                    //   dropdownColor: Colors.grey[300],
                    //   hint: const Text("Give a compliment",
                    //       style: TextStyle(fontSize: 16, color: Colors.black)),
                    //   icon: const Icon(
                    //     Icons.arrow_downward,
                    //     color: Colors.black,
                    //   ),
                    //   iconSize: 20,
                    //   elevation: 15,
                    //   style: const TextStyle(color: Colors.white),
                    //   decoration: const InputDecoration(
                    //     enabledBorder: UnderlineInputBorder(
                    //       borderSide:
                    //           BorderSide(color: Color(0xFFFEEFA8), width: 0),
                    //     ),
                    //     focusedBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(color: Colors.black),
                    //     ),
                    //   ),
                    //   validator: (val) =>
                    //       val != null ? null : "Please select an compliment",
                    //   onChanged: null,
                    //   items: <String>[
                    //     'Hindu',
                    //     'Sikh',
                    //   ].map<DropdownMenuItem<String>>((String value) {
                    //     return DropdownMenuItem<String>(
                    //       value: value,
                    //       child: Text(
                    //         value,
                    //         style: TextStyle(color: Colors.black),
                    //       ),
                    //     );
                    //   }).toList(),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(12.0),
                    //   child: TextFormField(
                    //     validator: (value) {
                    //       return value!.isEmpty
                    //           ? "Please choose a password".toUpperCase()
                    //           : null;
                    //     },
                    //     controller: _passwordController,
                    //     decoration: buildInputDecoration(
                    //       "Password".toUpperCase(),
                    //       "123@mypass",
                    //       Icon(FontAwesomeIcons.key),
                    //     ),
                    //     obscureText: true,
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(12.0),
                    //   child: TextFormField(
                    //     controller: _inviteCodeController,
                    //     decoration: buildInputDecoration(
                    //       "Invite Code".toUpperCase(),
                    //       "(Optional)",
                    //       Icon(FontAwesomeIcons.fileCode),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Colors.amber,
                          textStyle: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {
                          // sign in
                          // if (_formKey!.currentState!.validate()) {
                          //   // validated
                          //   String email = _emailController.text;
                          //   FirebaseAuth.instance
                          //       .createUserWithEmailAndPassword(
                          //     email: _emailController.text,
                          //     password: _passwordController.text,
                          //   )
                          //       .then((value) {
                          //     // create custom user
                          //     if (value.user != null) {
                          //       MemberService()
                          //           .createUser(
                          //         uid: value.user!.uid,
                          //         name: _nameController.text,
                          //         password: _passwordController.text,
                          //         email: _emailController.text,
                          //         phoneNumber: _mobileNumberController.text,
                          //         address: _addressController.text,
                          //         gender: _genderController.text,
                          //         caste: _casteController.text,
                          //         aadharNumber: _aadharNumberController.text,
                          //         inviteCode: _inviteCodeController.text,
                          //         context: context,
                          //       )
                          //           .then((value) {
                          //         MemberService()
                          //             .loginUser(
                          //           email,
                          //           _passwordController.text,
                          //         )
                          //             .then((value) {
                          //           return Navigator.push(
                          //             context,
                          //             MaterialPageRoute(
                          //               builder: (context) => MainPage(
                          //                 name: _nameController.text,
                          //               ),
                          //             ),
                          //           );
                          //         });
                          //       });
                          //     }
                          //   });
                          // }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CommunityList(),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "Create Account".toUpperCase(),
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
