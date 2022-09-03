import 'dart:io';
import 'dart:typed_data';

import 'package:community_internal/core/models/job.model.dart';
import 'package:community_internal/core/models/user_model.dart';
import 'package:community_internal/core/repository/jobs.repository.dart';
import 'package:community_internal/core/services/file.service.dart';
import 'package:community_internal/core/services/key_storage.service.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class CreateJobForum extends StatefulWidget {
  const CreateJobForum({Key? key}) : super(key: key);

  @override
  CreateJobForumState createState() => CreateJobForumState();
}

class CreateJobForumState extends State<CreateJobForum> {
  final FilePickerService _filePickerService = FilePickerService();
  TextEditingController firmNameController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController jobLocationController = TextEditingController();

  TextEditingController jobDescController = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController height = TextEditingController();
  String education = 'Graduation/Diploma';
  String salary = '1 LPA';
  String experience = '0-1 Years';
  DateTime? _selectedDate = DateTime.now();

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
  File? image;
  pickImage() {
    _filePickerService.pickImageFromGallery().then((value) async {
      if (value != null) {
        image = value;
        setState(() {});
      }
    });
  }

  String? genderValue;
  final _formKey = GlobalKey<FormState>();
  final JobRepository _jobRepository = JobRepository();
  final StorageService _storageService = StorageService();
  bool isBusy = false;
  // void createJob() async {

  // }

  @override
  Widget build(BuildContext context) {
    return LoadingHelper(
      isLoading: isBusy,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Post a Job".toUpperCase(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // actions: const [
          //   Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          //     child: CircleAvatar(
          //       backgroundColor: Colors.white70,
          //       child: Padding(
          //         padding: EdgeInsets.all(4.0),
          //         child: Text(
          //           "S",
          //           style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             color: Colors.black,
          //           ),
          //         ),
          //       ),
          //     ),
          //   )
          // ],
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextFormField(
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Please enter a valid firm name";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Firm Name',
                          hintText: 'Please fill firm name',
                        ),
                        controller: firmNameController,
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
                      child: TextFormField(
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Please enter a valid job title";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Job Title',
                          hintText: 'Please fill in Job Title',
                        ),
                        controller: jobTitleController,
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
                      child: TextFormField(
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Please enter a valid description";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Job Description',
                          hintText: 'Describe key responsibilities, skills...',
                        ),
                        controller: jobDescController,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                image != null
                    ? ListTile(
                        title: Image.file(
                          image!,
                          height: 120,
                        ),
                        trailing: TextButton(
                          child: const Text("Remove"),
                          onPressed: () {
                            image = null;
                            setState(() {});
                          },
                        ),
                      )
                    : ListTile(
                        subtitle: const Text("Upload company logo"),
                        trailing: TextButton(
                          onPressed: () {
                            pickImage();
                          },
                          child: const Text("Upload"),
                        ),
                        title: const Text(
                          "Pick image",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ListTile(
                        title: const Text(
                          'Male',
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(0, -5),
                              )
                            ],
                            color: Colors.transparent,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.grey,
                            decorationThickness: 4,
                          ),
                        ),
                        leading: Radio<String>(
                          value: "Male",
                          groupValue: genderValue,
                          onChanged: (value) {
                            setState(() {
                              genderValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: ListTile(
                        title: const Text(
                          'Female',
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(0, -5),
                              )
                            ],
                            color: Colors.transparent,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.grey,
                            decorationThickness: 4,
                          ),
                        ),
                        leading: Radio<String>(
                          value: "Female",
                          groupValue: genderValue,
                          onChanged: (value) {
                            setState(() {
                              genderValue = value;
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
                  child: Text(
                    "Job Requirements".toUpperCase(),
                    style: const TextStyle(
                      shadows: [
                        Shadow(color: Colors.black, offset: Offset(0, -5))
                      ],
                      color: Colors.transparent,
                      decorationColor: Colors.grey,
                      decorationThickness: 4,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: SizedBox(
                        height: 75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                "Select Experience".toUpperCase(),
                                style: const TextStyle(
                                  shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      offset: Offset(0, -5),
                                    )
                                  ],
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.grey,
                                  decorationThickness: 4,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Card(
                                  elevation: 0,
                                  color: Colors.grey[400],
                                  child: Center(
                                    child: DropdownButtonFormField<String>(
                                      validator: (value) {
                                        if (value?.isEmpty ?? true) {
                                          return "Please choose option";
                                        }
                                        return null;
                                      },
                                      value: experience,
                                      items: exp.map((String experience) {
                                        return DropdownMenuItem<String>(
                                          value: experience,
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 7,
                                              ),
                                              child: Text(experience),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String? value) {
                                        setState(() {
                                          experience = value!;
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
                    SizedBox(
                      width: double.infinity,
                      height: 75,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: Text(
                              "Select Education".toUpperCase(),
                              style: const TextStyle(
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    offset: Offset(0, -5),
                                  )
                                ],
                                color: Colors.transparent,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.grey,
                                decorationThickness: 4,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Card(
                                elevation: 0,
                                color: Colors.grey[400],
                                child: Center(
                                  child: DropdownButtonFormField<String>(
                                    validator: (value) {
                                      if (value?.isEmpty ?? true) {
                                        return "Please choose option";
                                      }
                                      return null;
                                    },
                                    value: education,
                                    items: edu.map((String experience) {
                                      return DropdownMenuItem<String>(
                                        value: experience,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 7,
                                            ),
                                            child: Text(experience),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      setState(() {
                                        education = value!;
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
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: SizedBox(
                        width: double.infinity,
                        height: 75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                "Select Salary".toUpperCase(),
                                style: const TextStyle(
                                  shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      offset: Offset(0, -5),
                                    )
                                  ],
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.grey,
                                  decorationThickness: 4,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Card(
                                  elevation: 0,
                                  color: Colors.grey[400],
                                  child: Center(
                                    child: DropdownButtonFormField<String>(
                                      validator: (value) {
                                        if (value?.isEmpty ?? true) {
                                          return "Please choose option";
                                        }
                                        return null;
                                      },
                                      value: salary,
                                      items: sal.map((String experience) {
                                        return DropdownMenuItem<String>(
                                          value: experience,
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 7,
                                              ),
                                              child: Text(experience),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String? value) {
                                        setState(() {
                                          salary = value!;
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
                  child: GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate!,
                          firstDate: DateTime(2000),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));
                      setState(() {
                        if (pickedDate != null) {
                          _selectedDate = pickedDate;
                          date.text = _selectedDate != null
                              ? DateFormat('yMd').format(_selectedDate!)
                              : 'End Date';
                        }
                      });
                    },
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextFormField(
                          controller: date,
                          enabled: false,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Please fill in end date',
                          ),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return "Please fill in end date";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Job Location',
                          hintText: 'Please fill in Job Location',
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Please fill in Job Location";
                          }
                          return null;
                        },
                        controller: jobLocationController,
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 300,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () async {
                      UserModel user = _storageService.getCurrentUser()!;
                      if (_formKey.currentState!.validate() && image != null) {
                        setState(() {
                          isBusy = true;
                        });
                        bool res = await _jobRepository.postJob(
                          {
                            'userId': user.id.toString(),
                            'jobsTitle': jobTitleController.text.trim(),
                            'description': jobDescController.text.trim(),
                            'companyName': firmNameController.text.trim(),
                            'gender': genderValue.toString(),
                            'experience': experience,
                            'education': education,
                            'location': jobLocationController.text.trim(),
                            'packages': salary,
                            'status': "enable",
                            'date': DateTime.now().toString(),
                            'endDate': _selectedDate.toString(),
                          },
                          image,
                        );
                        setState(() {
                          isBusy = false;
                        });
                        if (res) {
                          Navigator.pop(context, true);
                        }
                      }
                    },
                    child: Text(
                      "Post".toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
