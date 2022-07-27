import 'dart:ui';
import 'dart:io';
import 'package:community_internal/core/services/file.service.dart';
import 'package:community_internal/ui/screens/community_list.dart';
import 'package:flutter/material.dart';

List<TextEditingController> _controller = [
  for (int i = 1; i < 13; i++) TextEditingController()
];
List gender = ["Male", "Female", "Other"];
late String select;

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  File? _selectedImage;
  String _selectedGender = 'male';
  List<Icon> icons = const [
    Icon(
      Icons.person,
      color: Colors.black,
    ),
    Icon(
      Icons.person,
      color: Colors.black,
    ),
    Icon(
      Icons.phone_android,
      color: Colors.black,
    ),
    Icon(
      Icons.attach_email,
      color: Colors.black,
    ),
    Icon(
      Icons.countertops,
      color: Colors.black,
    ),
    Icon(
      Icons.map_outlined,
      color: Colors.black,
    ),
    Icon(
      Icons.location_on_sharp,
      color: Colors.black,
    ),
    Icon(
      Icons.book_outlined,
      color: Colors.black,
    ),
    Icon(Icons.vertical_split, color: Colors.black),
    Icon(Icons.add_card_outlined, color: Colors.black),
    Icon(Icons.airplanemode_active, color: Colors.black),
  ];
  List<String> data = [
    "",
    "Name",
    "Phone Number",
    "Email",
    "State",
    "District",
    "Town",
    "Address",
    "Religion",
    "Aadhar card number",
    "Passport Number"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 11,
              itemBuilder: (context, index) {
                return index == 0
                    ? Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: CircleAvatar(
                                radius: 70,
                                backgroundColor: Colors.black,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 67,
                                  backgroundImage:
                                      _selectedImage?.path.isNotEmpty ?? false
                                          ? Image.file(_selectedImage!).image
                                          : const NetworkImage(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjzKgGevOlmVCQ_ROMb5GhVGn-8bCG2ncUNA&usqp=CAU",
                                            ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 85, horizontal: 130),
                            child: InkWell(
                              onTap: () {
                                final FilePickerService _filePickerService =
                                    FilePickerService();
                                final pickedImage =
                                    _filePickerService.pickImageFromGallery();
                                pickedImage.then((value) {
                                  if (value?.path.isNotEmpty ?? false) {
                                    setState(() {
                                      _selectedImage = value;
                                    });
                                  }
                                });
                              },
                              child: const CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.black,
                                  child: Icon(
                                    Icons.edit,
                                    size: 20,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      )
                    : index != 4
                        ? Row(
                            children: [
                              Container(
                                  height: 70,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(3)),
                                  ),
                                  child: icons[index]),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index].toUpperCase(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400),
                                    ),
                                    TextField(
                                      controller: _controller[index],
                                      keyboardType: index == 2
                                          ? TextInputType.number
                                          : TextInputType.text,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              SizedBox(
                                height: 80,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 3, horizontal: 37),
                                      child: Text(' GENDER:'),
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 24,
                                        ),
                                        Radio<String>(
                                          value: 'male',
                                          groupValue: _selectedGender,
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedGender = value!;
                                            });
                                          },
                                        ),
                                        const Text("MALE"),
                                        const SizedBox(
                                          width: 70,
                                        ),
                                        Radio<String>(
                                          value: 'female',
                                          groupValue: _selectedGender,
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedGender = value!;
                                            });
                                          },
                                        ),
                                        const Text('FEMALE'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                      height: 70,
                                      width: 30,
                                      decoration: const BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(3)),
                                      ),
                                      child: icons[index]),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data[index].toUpperCase(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400),
                                        ),
                                        TextField(
                                          controller: _controller[index],
                                          keyboardType: index == 2
                                              ? TextInputType.number
                                              : TextInputType.text,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.maxFinite, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CommunityList()),
                  );
                },
                child: const Text(
                  "NEXT",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 19,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _selectedGender = 'male';
  List<Icon> icons = const [
    Icon(
      Icons.person,
      color: Colors.black,
    ),
    Icon(
      Icons.person,
      color: Colors.black,
    ),
    Icon(
      Icons.phone_android,
      color: Colors.black,
    ),
    Icon(
      Icons.attach_email,
      color: Colors.black,
    ),
    Icon(
      Icons.countertops,
      color: Colors.black,
    ),
    Icon(
      Icons.map_outlined,
      color: Colors.black,
    ),
    Icon(
      Icons.location_on_sharp,
      color: Colors.black,
    ),
    Icon(
      Icons.book_outlined,
      color: Colors.black,
    ),
    Icon(Icons.vertical_split, color: Colors.black),
    Icon(Icons.add_card_outlined, color: Colors.black),
    Icon(Icons.airplanemode_active, color: Colors.black),
  ];
  List<String> datas = [
    "",
    "Name",
    "pHONE Number",
    "Email",
    "State",
    "District",
    "town",
    "Address",
    "Religion",
    "Aadhar card number",
    "passport number"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 11,
                  itemBuilder: (context, index) {
                    print("shivam ${_controller[index].text}");
                    return index == 0
                        ? Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: CircleAvatar(
                                    radius: 70,
                                    backgroundColor: Colors.black,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 67,
                                      child: SizedBox(
                                          height: 74,
                                          width: 60,
                                          child: Image.network(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjzKgGevOlmVCQ_ROMb5GhVGn-8bCG2ncUNA&usqp=CAU",
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 85, horizontal: 130),
                                child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.black,
                                    child: Icon(
                                      Icons.edit,
                                      size: 20,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          )
                        : index != 4
                            ? Row(
                                children: [
                                  Container(
                                      height: 70,
                                      width: 30,
                                      decoration: const BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(3)),
                                      ),
                                      child: icons[index]),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        Text(
                                          datas[index].toUpperCase(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 26),
                                          child: Text(
                                            _controller[index].text,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 300, vertical: 10),
                                          child: Icon(Icons.edit),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : SizedBox(
                                height: 80,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 3, horizontal: 37),
                                      child: Text(' GENDER:'),
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 24,
                                        ),
                                        Container(
                                          child: Radio<String>(
                                            value: 'male',
                                            groupValue: _selectedGender,
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedGender = value!;
                                              });
                                            },
                                          ),
                                        ),
                                        const Text("MALE"),
                                        const SizedBox(
                                          width: 70,
                                        ),
                                        Container(
                                          child: Radio<String>(
                                            value: 'female',
                                            groupValue: _selectedGender,
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedGender = value!;
                                              });
                                            },
                                          ),
                                        ),
                                        const Text('FEMALE'),
                                      ],
                                    )
                                  ],
                                ),
                              );
                  })),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ))),
                onPressed: () async {
// Update User Profile
                  // UserRepository().updateUserProfile()
                  Navigator.pop(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const CommunityList()),
                  // );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 120),
                  child: Text(
                    "SAVE",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 19),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
