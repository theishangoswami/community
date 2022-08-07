import 'dart:io';
import 'dart:typed_data';

import 'package:community_internal/app/locator.dart';
import 'package:community_internal/core/models/city.dart';
import 'package:community_internal/core/models/community.dart';
import 'package:community_internal/core/models/district.dart';
import 'package:community_internal/core/models/pincode.dart';
import 'package:community_internal/core/models/state_detail.dart';
import 'package:community_internal/core/repository/users.repository.dart';
import 'package:community_internal/core/services/file.service.dart';
import 'package:community_internal/ui/screens/community_list.dart';
import 'package:community_internal/ui/screens/verification_ui.dart';
import 'package:community_internal/ui/widgets/gender_selection.dart';
import 'package:community_internal/ui/widgets/profile_field.dart';
import 'package:community_internal/ui/widgets/profile_field_drop_down.dart';
import 'package:community_internal/ui/widgets/profile_image.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final TextEditingController _addressController = TextEditingController();
  bool _isLoading = false;
  File? _selectedImage;
  String _selectedGender = 'male';
  final _formKey = GlobalKey<FormState>();
  bool imageError = false;

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

  List<Pincode> _pincodeList = [
    Pincode(id: '-1', cityId: '-1', pinCode: 'Select Pincode'),
  ];
  Pincode _selectedPincode =
  Pincode(id: '-1', cityId: '-1', pinCode: 'Select Pincode');

  final List<Community> _communityList = [
    Community(
      id: '-1',
      communityName: 'Select Community',
      status: 'active',
    )
  ];
  Community _selectedCommunity = Community(
    id: '-1',
    communityName: 'Select Community',
    status: 'active',
  );

  void refreshDistrictList() {
    _districtList = [
      District(id: '-1', districtName: 'Select District', stateId: '-1')
    ];
    _selectedDistrict =
        District(id: '-1', districtName: 'Select District', stateId: '-1');
  }

  void refreshCityList() {
    _cityList = [City(id: '-1', cityName: 'Select City', districtId: '-1')];
    _selectedCity = City(id: '-1', cityName: 'Select City', districtId: '-1');
  }

  void refreshPincodeList() {
    _pincodeList = [
      Pincode(id: '-1', cityId: '-1', pinCode: 'Select Pincode'),
    ];
    _selectedPincode =
        Pincode(id: '-1', cityId: '-1', pinCode: 'Select Pincode');
  }

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
    refreshDistrictList();
    refreshCityList();
    refreshPincodeList();
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
    refreshCityList();
    refreshPincodeList();
    setState(() {
      _isLoading = true;
    });
    await UserRepository().getCity().then((value) {
      if (value?.isNotEmpty ?? false) {
        setState(() {
          _cityList.addAll(
            value!.where((element) => element.districtId == districtId),
          );
          _isLoading = false;
        });
      }
    });
  }

  void fetchPincodeList(String cityId) async {
    refreshPincodeList();
    setState(() {
      _isLoading = true;
    });
    await UserRepository().getPincode().then((value) {
      if (value?.isNotEmpty ?? false) {
        setState(() {
          _pincodeList.addAll(
            value!.where((element) => element.cityId == cityId),
          );
          _isLoading = false;
        });
      }
    });
  }

  void fetchCommunityList() async {
    await UserRepository().getCommunity().then((value) {
      if (value?.isNotEmpty ?? false) {
        setState(() {
          _communityList.addAll(value!);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _phoneController.text = widget.phoneNumber;
    fetchStateList();
    fetchCommunityList();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingHelper(
      isLoading: _isLoading,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("User Details"),
          ),
          body: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileImage(
                    selectedImage: _selectedImage,
                    onTap: () {
                      final FilePickerService _filePickerService =
                      FilePickerService();
                      final pickedImage =
                      _filePickerService.pickImageFromGallery();
                      pickedImage.then((value) {
                        if (value?.path.isNotEmpty ?? false) {
                          setState(() {
                            _selectedImage = value;
                            imageError = false;
                          });
                        }
                      });
                    },
                  ),
                  imageError
                      ? const Text(
                    'Please select a image',
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  )
                      : const SizedBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  ProfileTextFeild(
                    icon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
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
                    validator: (value) {
                      String p =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                      RegExp regExp = RegExp(p);
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your email';
                      } else if (!regExp.hasMatch(value?.trim() ?? '')) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    displaytText: 'email'.toUpperCase(),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  GenderSelection(
                    selectedGender: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                  ),
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
                      fetchPincodeList(_selectedCity.id);
                    },
                  ),
                  PincodeProfileFieldDropDown(
                    icon: const Icon(
                      Icons.book_outlined,
                      color: Colors.black,
                    ),
                    onChanged: (Pincode? newValue) {
                      setState(() {
                        _selectedPincode = newValue!;
                      });
                    },
                    pincodeList: _pincodeList,
                    selectedPincode: _selectedPincode,
                  ),
                  CommunityProfileFieldDropDown(
                    icon: const Icon(
                      Icons.vertical_split,
                      color: Colors.black,
                    ),
                    communityList: _communityList,
                    selectedCommunity: _selectedCommunity,
                    onChanged: (Community? newValue) {
                      setState(() {
                        _selectedCommunity = newValue!;
                      });
                    },
                  ),
                  ProfileTextFeild(
                    icon: const Icon(
                      Icons.add_card_outlined,
                      color: Colors.black,
                    ),
                    validator: (value) {
                      String text = (value ?? "").trim();
                      if (text.isEmpty) {
                        return "Please enter your address";
                      }
                      return null;
                    },
                    displaytText: 'address'.toUpperCase(),
                    controller: _addressController,
                    keyboardType: TextInputType.streetAddress,
                  ),
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
                    validator: (value) {
                      String p = r'(?!^0+$)[a-zA-Z0-9]{6,9}$';

                      RegExp regExp = RegExp(p);
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your passport number';
                      } else if (!regExp.hasMatch(value?.trim() ?? "") ||
                          value!.length != 8) {
                        return 'Enter a valid passport number';
                      }
                      return null;
                    },
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
                        onPressed: () async {
                          setState(() {
                            if (_selectedImage?.path.isEmpty ?? true) {
                              imageError = true;
                            }
                          });
                          if (_formKey.currentState!.validate() &&
                              !imageError) {
                            final SharedPreferences _sharedPreferences =
                            locator<SharedPreferences>();
                            await _sharedPreferences.setString(
                                'communityId', _selectedCommunity.id);
                            setState(() {
                              _isLoading = true;
                            });
                            await UserRepository().userRegistration(
                              {
                                'name': _nameController.text.trim(),
                                'mobile_number': _phoneController.text.trim(),
                                'email': _emailController.text.trim(),
                                'adhar_card':
                                _aadhaarCardController.text.trim(),
                                'passport_no': _passPortController.text.trim(),
                                'state_id': _selectedState.id,
                                'district_id': _selectedDistrict.id,
                                'city_id': _selectedCity.id,
                                'pincode_id': _selectedPincode.id,
                                'community_id': _selectedCommunity.id,
                                'gender': _selectedGender,
                                'address': _addressController.text.trim(),
                                'country_id': '1'
                              },
                              _selectedImage,
                            );
                            setState(() {
                              _isLoading = false;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerifyPage(
                                  phonenumber: widget.phoneNumber,
                                ),
                              ),
                            );
                          }
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
        ),
      ),
    );
  }
}


class Profilee extends StatefulWidget {
  const Profilee({Key? key}) : super(key: key);

  @override
  State<Profilee> createState() => _ProfileeState();
}

class _ProfileeState extends State<Profilee> {
  List<TextEditingController> _controller = [
    for (int i = 1; i < 25; i++) TextEditingController()
  ];
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
      Icons.pin,
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
    Icon(
      Icons.person,
      color: Colors.black,
    ),
    Icon(
      Icons.person,
      color: Colors.black,
    ),
    Icon(
      Icons.person,
      color: Colors.black,
    ),
    Icon(
      Icons.person,
      color: Colors.black,
    ),
    Icon(
      Icons.person,
      color: Colors.black,
    ),
    Icon(
      Icons.person,
      color: Colors.black,
    ),
    Icon(
      Icons.person,
      color: Colors.black,
    ),
    Icon(
      Icons.person,
      color: Colors.black,
    ),
    Icon(
      Icons.cast_for_education,
      color: Colors.black,
    ),
    Icon(
      Icons.cast_for_education,
      color: Colors.black,
    ),
    Icon(
      Icons.cast_for_education,
      color: Colors.black,
    ),
    Icon(
      Icons.cast_for_education,
      color: Colors.black,
    ),

  ];
  List<String> datas = [
    "",
    "Name",
    "Email",
    "",
    "State",
    "District",
    "town",
    "Pin code",
    "Address",
    "Religion",
    "Aadhar card number",
    "passport number",
    "Rishi Gotra",
    "Shasan Gotra",
    "Pravar Shankya",
    "Pravar Naam",
    "Sutra",
    "Ved",
    "Devta",
    "Shaka",
    "Education 10th",
    "Education 12th",
    "Education Graduation",
    "Education Post Graduation",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount:23,
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
                                child: Container(
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
                        : index != 3
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
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Text(
                                datas[index].toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w400),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 26),
                                child: Text(
                                  _controller[index].text,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 300, vertical: 10),
                                child: Icon(Icons.edit),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                        : Container(
                      height: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 37),
                            child: const Text(' GENDER:'),
                          ),
                          Row(
                            children: [
                              SizedBox(
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
                              Text("MALE"),
                              SizedBox(
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
                              Text('FEMALE'),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CommunityList()),
                  );
                },
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 120),
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
