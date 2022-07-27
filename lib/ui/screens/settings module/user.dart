import 'package:community_internal/core/models/city.dart';
import 'package:community_internal/core/models/district.dart';
import 'package:community_internal/core/models/state_detail.dart';
import 'package:community_internal/core/repository/users.repository.dart';
import 'package:community_internal/ui/screens/community_list.dart';
import 'package:community_internal/ui/widgets/gender_selection.dart';
import 'package:community_internal/ui/widgets/profile_field.dart';
import 'package:community_internal/ui/widgets/profile_field_drop_down.dart';
import 'package:community_internal/ui/widgets/profile_image.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<TextEditingController> _controller = [
  for (int i = 1; i < 13; i++) TextEditingController()
];

class UserDetails extends StatefulWidget {
  final String phoneNumber;
  const UserDetails({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _aadhaarCardController = TextEditingController();
  final TextEditingController _passPortController = TextEditingController();
  bool _isLoading = false;

  final List<StateDetail> _stateList = [
    StateDetail(id: '-1', stateName: 'Select State')
  ];
  StateDetail _selectedState = StateDetail(id: '-1', stateName: 'Select State');

  List<District> _districtList = [
    District(id: '-1', districtName: 'Select District', stateId: '-1')
  ];
  District _selectedDistrict =
      District(id: '-1', districtName: 'Select District', stateId: '-1');

  List<City> _cityList = [
    City(id: '-1', cityName: 'Select City', districtId: '-1')
  ];
  City _selectedCity =
      City(id: '-1', cityName: 'Select City', districtId: '-1');

  void fetchStateList() async {
    await UserRepository().getState().then((value) {
      if (value?.isNotEmpty ?? false) {
        setState(() {
          _stateList.addAll(value!);
        });
      }
    });
  }

  void fetchDistrictList(String stateId) async {
    _districtList = [
      District(id: '-1', districtName: 'Select District', stateId: '-1')
    ];
    _selectedDistrict =
        District(id: '-1', districtName: 'Select District', stateId: '-1');
    _cityList = [City(id: '-1', cityName: 'Select City', districtId: '-1')];
    _selectedCity = City(id: '-1', cityName: 'Select City', districtId: '-1');
    setState(() {
      _isLoading = true;
    });
    await UserRepository().getDistrict().then((value) {
      if (value?.isNotEmpty ?? false) {
        setState(() {
          _districtList
              .addAll(value!.where((element) => element.stateId == stateId));
          _isLoading = false;
        });
      }
    });
  }

  void fetchCityList(String districtId) async {
    _cityList = [City(id: '-1', cityName: 'Select City', districtId: '-1')];
    setState(() {
      _isLoading = true;
    });
    await UserRepository().getCity().then((value) {
      if (value?.isNotEmpty ?? false) {
        setState(() {
          _cityList.addAll(
              value!.where((element) => element.districtId == districtId));
          _isLoading = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _phoneController.text = widget.phoneNumber;
    fetchStateList();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingHelper(
      isLoading: _isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("User Details"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileImage(),
              ProfileTextFeild(
                icon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                displaytText: 'name'.toUpperCase(),
                controller: _nameController,
                keyboardType: TextInputType.name,
              ),
              ProfileTextFeild(
                icon: const Icon(
                  Icons.phone_android,
                  color: Colors.black,
                ),
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
                displaytText: 'phone number'.toUpperCase(),
                controller: _phoneController,
                keyboardType: TextInputType.phone,
              ),
              ProfileTextFeild(
                icon: const Icon(
                  Icons.attach_email,
                  color: Colors.black,
                ),
                displaytText: 'email'.toUpperCase(),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const GenderSelection(),
              StateProfileFieldDropDown(
                icon: const Icon(
                  Icons.countertops,
                  color: Colors.black,
                ),
                stateList: _stateList,
                selectedState: _selectedState,
                onChanged: (StateDetail? newValue) {
                  setState(() {
                    _selectedState = newValue!;
                  });
                  fetchDistrictList(_selectedState.id);
                },
              ),
              DistrictProfileFieldDropDown(
                icon: const Icon(
                  Icons.map_outlined,
                  color: Colors.black,
                ),
                districtList: _districtList,
                selectedDistrict: _selectedDistrict,
                onChanged: (District? newValue) {
                  setState(() {
                    _selectedDistrict = newValue!;
                  });
                  fetchCityList(_selectedDistrict.id);
                },
              ),
              CityProfileFieldDropDown(
                icon: const Icon(
                  Icons.location_on_sharp,
                  color: Colors.black,
                ),
                selectedCity: _selectedCity,
                cityList: _cityList,
                onChanged: (City? newValue) {
                  setState(() {
                    _selectedCity = newValue!;
                  });
                },
              ),
              // const ProfileFieldDropDown(
              //   icon: Icon(
              //     Icons.book_outlined,
              //     color: Colors.black,
              //   ),
              // ),
              // const ProfileFieldDropDown(
              //   icon: Icon(
              //     Icons.vertical_split,
              //     color: Colors.black,
              //   ),
              // ),
              ProfileTextFeild(
                icon: const Icon(
                  Icons.add_card_outlined,
                  color: Colors.black,
                ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  String text = (value ?? "").trim();
                  if (text.isEmpty) {
                    return "Please enter your aadhaar number";
                  } else if (text.length != 12) {
                    return "Please enter a valid aadhaar number";
                  }
                  return null;
                },
                displaytText: 'aadhaar card number'.toUpperCase(),
                controller: _aadhaarCardController,
                keyboardType: TextInputType.number,
              ),
              ProfileTextFeild(
                icon: const Icon(
                  Icons.airplanemode_active,
                  color: Colors.black,
                ),
                displaytText: 'passport number'.toUpperCase(),
                controller: _passPortController,
                keyboardType: TextInputType.text,
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
        ),
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
