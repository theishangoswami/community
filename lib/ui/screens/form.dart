import 'package:flutter/material.dart';

import 'Job_description.dart';

class Formm extends StatefulWidget {
  const Formm({Key? key}) : super(key: key);

  @override
  FormmState createState() => FormmState();
}

class FormmState extends State<Formm> {
  TextEditingController firm = TextEditingController();
  TextEditingController employeeId = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController height = TextEditingController();
  String education = 'Graduation/Diploma';
  String salary = '1 LPA';
  String experience = '0-1 Years';

// List of items in our dropdown menu
  var edu = [
    'Doctorate',
    'Post-Graduation',
    'Graduation/Diploma',
    'Higher Secondary',
    'School'
  ];

  var exp = [
    'Freshers',
    '0-1 Years',
    '1-3 Years',
    '3-5 Years',
    '5-10 Years',
    '10 Years'
  ];
  var sal = [
    '1 LPA',
    '2 LPA',
    '3 LPA',
    '4-5 LPA',
    '5-6 LPA',
    '6-7 LPA',
    '7-9 LPA',
    '9-10 LPA',
    '10 LPA',
  ];
// ignore: prefer_typing_uninitialized_variables
  var val;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text("Post a Full Time Job".toUpperCase(),
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        actions: const [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: CircleAvatar(
              backgroundColor: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "S",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       Icon(Icons.add_road),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Text("Switch Job Type".toUpperCase(),
            //           style: TextStyle(
            //               decorationThickness: 4,
            //               fontSize: 14,
            //               fontWeight: FontWeight.bold))
            //     ],
            //   ),
            // ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Firm Name',
                              hintText: 'Please fill firm name'),
                          controller: firm,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Job Title',
                              hintText: 'Please fill in Job Title'),
                          controller: employeeId,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Job Description',
                              hintText:
                                  'Describe key responsibilities, skills...'),
                          controller: firstname,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        child: ListTile(
                          title: const Text(
                            'Male',
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: Colors.black, offset: Offset(0, -5))
                              ],
                              color: Colors.transparent,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.grey,
                              decorationThickness: 4,
                            ),
                          ),
                          leading: Radio(
                            value: 1,
                            groupValue: val,
                            onChanged: (value) {
                              setState(() {
                                val = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Container(
                        width: 192,
                        child: ListTile(
                          title: const Text(
                            'Female',
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: Colors.black, offset: Offset(0, -5))
                              ],
                              color: Colors.transparent,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.grey,
                              decorationThickness: 4,
                            ),
                          ),
                          leading: Radio(
                            value: 2,
                            groupValue: val,
                            onChanged: (value) {
                              setState(() {
                                val = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text("Job Requirements".toUpperCase(),
                        style: TextStyle(
                          shadows: [
                            Shadow(color: Colors.black, offset: Offset(0, -5))
                          ],
                          color: Colors.transparent,
                          decorationColor: Colors.grey,
                          decorationThickness: 4,
                        )),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Container(
                          width: double.infinity,
                          height: 75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text("Select Experience".toUpperCase(),
                                    style: TextStyle(
                                      shadows: [
                                        Shadow(
                                            color: Colors.black,
                                            offset: Offset(0, -5))
                                      ],
                                      color: Colors.transparent,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.grey,
                                      decorationThickness: 4,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Container(
                                  width: 200,
                                  child: Card(
                                    elevation: 0,
                                    color: Colors.grey[400],
                                    child: Center(
                                      child: DropdownButton(
                                        value: experience,
                                        items: exp.map((String experience) {
                                          return DropdownMenuItem(
                                            value: experience,
                                            child: Center(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 7),
                                              child: Text(experience),
                                            )),
                                          );
                                        }).toList(),
                                        onChanged: (String? Value) {
                                          setState(() {
                                            experience = Value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 75,
                        child: Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(24),
                                child: Text("Select Education".toUpperCase(),
                                    style: TextStyle(
                                      shadows: [
                                        Shadow(
                                            color: Colors.black,
                                            offset: Offset(0, -5))
                                      ],
                                      color: Colors.transparent,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.grey,
                                      decorationThickness: 4,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Container(
                                  width: 200,
                                  child: Card(
                                    elevation: 0,
                                    color: Colors.grey[400],
                                    child: Center(
                                      child: DropdownButton(
                                        value: education,
                                        items: edu.map((String experience) {
                                          return DropdownMenuItem(
                                            value: experience,
                                            child: Center(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 7),
                                              child: Text(experience),
                                            )),
                                          );
                                        }).toList(),
                                        onChanged: (String? Value) {
                                          setState(() {
                                            education = Value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          width: double.infinity,
                          height: 75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text("Select Salary".toUpperCase(),
                                    style: TextStyle(
                                      shadows: [
                                        Shadow(
                                            color: Colors.black,
                                            offset: Offset(0, -5))
                                      ],
                                      color: Colors.transparent,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.grey,
                                      decorationThickness: 4,
                                    )),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Container(
                                  width: 200,
                                  child: Card(
                                    elevation: 0,
                                    color: Colors.grey[400],
                                    child: Center(
                                      child: DropdownButton(
                                        value: salary,
                                        items: sal.map((String experience) {
                                          return DropdownMenuItem(
                                            value: experience,
                                            child: Center(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 7),
                                              child: Text(experience),
                                            )),
                                          );
                                        }).toList(),
                                        onChanged: (String? Value) {
                                          setState(() {
                                            salary = Value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Job Location',
                              hintText: 'Please fill in Job Location'),
                          controller: employeeId,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      "Note: The job details cannot be modified  after the job is posted.",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 300,
                    height: 45,
                    child: RaisedButton(
                      color: Colors.amber,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Job()),
                        );
                      },
                      child: Text(
                        "Post".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white70),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
