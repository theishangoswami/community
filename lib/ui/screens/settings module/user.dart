import 'dart:io';

import 'package:community_internal/app/locator.dart';
import 'package:community_internal/core/models/city.dart';
import 'package:community_internal/core/models/community.dart';
import 'package:community_internal/core/models/country.dart';
import 'package:community_internal/core/models/district.dart';
import 'package:community_internal/core/models/gotra.dart';
import 'package:community_internal/core/models/pincode.dart';
import 'package:community_internal/core/models/state_detail.dart';
import 'package:community_internal/core/models/user_model.dart';
import 'package:community_internal/core/repository/users.repository.dart';
import 'package:community_internal/core/services/file.service.dart';
import 'package:community_internal/core/services/key_storage.service.dart';
import 'package:community_internal/ui/screens/verification_ui.dart';
import 'package:community_internal/ui/widgets/gender_selection.dart';
import 'package:community_internal/ui/widgets/profile_field.dart';
import 'package:community_internal/ui/widgets/profile_field_drop_down.dart';
import 'package:community_internal/ui/widgets/profile_image.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDetails extends StatefulWidget {
  final String phoneNumber;
  final bool isUpdate;
  const UserDetails({
    Key? key,
    required this.phoneNumber,
    this.isUpdate = false,
  }) : super(key: key);

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
  final TextEditingController _highSchoolController = TextEditingController();
  final TextEditingController _interMediateController = TextEditingController();
  final TextEditingController _graduationController = TextEditingController();
  final TextEditingController _postGraduationController =
      TextEditingController();
  bool _isLoading = false;
  File? _selectedImage;
  String _selectedGender = 'male';
  final _formKey = GlobalKey<FormState>();
  bool imageError = false;
  final List<Country> _countryList = [
    Country(id: '-1', countryName: 'Select Country'),
  ];
  Country _selectedCountry = Country(id: '-1', countryName: 'Select Country');
  List<StateDetail> _stateList = [
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
  final List<Gotra> _gotraList = [
    Gotra(id: '-1', gotraName: 'Select Gotra'),
  ];
  Gotra _selectedGotra = Gotra(id: '-1', gotraName: 'Select Gotra');
  void refreshStateList() {
    _stateList = [StateDetail(id: '-1', stateName: 'Select State')];
    _selectedState = StateDetail(id: '-1', stateName: 'Select State');
  }

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

  Future<void> fetchStateList(String countryId) async {
    refreshStateList();
    setState(() {
      _isLoading = true;
    });
    await UserRepository().getState().then((value) {
      if (value?.isNotEmpty ?? false) {
        setState(() {
          _stateList.addAll(
              value!.where((element) => element.countryId == countryId));
          _isLoading = false;
        });
      }
    });
  }

  Future<void> fetchDistrictList(String stateId) async {
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

  Future<void> fetchCityList(String districtId) async {
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

  Future<void> fetchPincodeList(String cityId) async {
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

  Future<void> fetchCommunityList() async {
    await UserRepository().getCommunity().then((value) {
      if (value?.isNotEmpty ?? false) {
        setState(() {
          _communityList.addAll(value!);
        });
      }
    });
  }

  Future<void> fetchGotraList() async {
    await UserRepository().getGotra().then((value) {
      if (value?.isNotEmpty ?? false) {
        setState(() {
          _gotraList.addAll(value!);
        });
      }
    });
  }

  Future<void> fetchCountryList() async {
    refreshStateList();
    refreshDistrictList();
    refreshCityList();
    refreshPincodeList();
    await UserRepository().getCountry().then((value) {
      if (value?.isNotEmpty ?? false) {
        setState(() {
          _countryList.addAll(value!);
        });
      }
    });
  }

  Future<void> fetchProfileDetails() async {
    setState(() {
      _isLoading = true;
    });
    final user = StorageService().getCurrentUser()!;
    _nameController.text = user.userName!;
    _emailController.text = user.userEmail!;
    _selectedGender = user.gender!;
    _addressController.text = user.address!;
    _aadhaarCardController.text = user.adharNumber!;
    _passPortController.text = user.passportNumber ?? '';
    await fetchCountryList();
    _selectedCountry =
        _countryList.firstWhere((country) => country.id == user.countryId);
    await fetchStateList(_selectedCountry.id);
    _selectedState = _stateList.firstWhere((state) => state.id == user.stateId);
    await fetchDistrictList(_selectedState.id);
    _selectedDistrict =
        _districtList.firstWhere((district) => district.id == user.districtId);
    await fetchCityList(_selectedDistrict.id);
    _selectedCity = _cityList.firstWhere((city) => city.id == user.cityId);
    await fetchPincodeList(_selectedCity.id);
    _selectedPincode =
        _pincodeList.firstWhere((pincode) => pincode.id == user.pinCodeId);
    await fetchCommunityList();
    _selectedCommunity = _communityList
        .firstWhere((community) => community.id == user.communityId);
    await fetchGotraList();
    _selectedGotra = user.gotraId?.isNotEmpty ?? false
        ? _gotraList.firstWhere((gotra) => gotra.id == user.gotraId)
        : _selectedGotra;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _phoneController.text = widget.phoneNumber;
    if (widget.isUpdate) {
      fetchProfileDetails();
    } else {
      fetchCountryList();
      fetchCommunityList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = StorageService().getCurrentUser()!;
    return LoadingHelper(
      isLoading: _isLoading,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.isUpdate ? 'Update Profile' : "User Details"),
          ),
          body: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileImage(
                    imageUrl: user.profile,
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
                      ? widget.isUpdate
                          ? const SizedBox()
                          : const Text(
                              'Please select a image',
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            )
                      : const SizedBox(),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                    child: Text(
                      "BASIC DETAILS",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  SizedBox(
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
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
                    child: Text(
                      "RESIDENCE DETAILS",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  CountryProfileFieldDropDown(
                    icon: const Icon(
                      Icons.flag,
                      color: Colors.black,
                    ),
                    countryList: _countryList,
                    selectedCountry: _selectedCountry,
                    onChanged: (Country? newValue) {
                      setState(() {
                        _selectedCountry = newValue!;
                      });
                      fetchStateList(_selectedCountry.id);
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
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
                    child: Text(
                      "PERSONAL DETAILS",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
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
                  widget.isUpdate
                      ? GotraProfileFieldDropDown(
                          icon: const Icon(
                            Icons.vertical_split,
                            color: Colors.black,
                          ),
                          gotraList: _gotraList,
                          selectedGotra: _selectedGotra,
                          onChanged: (Gotra? newValue) {
                            setState(() {
                              _selectedGotra = newValue!;
                            });
                          },
                        )
                      : const SizedBox(),
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
                        return null;
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
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
                    child: Text(
                      "EDUCATION DETAILS",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  widget.isUpdate
                      ? Column(
                          children: [
                            ProfileTextFeild(
                              icon: const Icon(
                                Icons.cast_for_education,
                                color: Colors.black,
                              ),
                              displaytText: 'Education 10th'.toUpperCase(),
                              controller: _highSchoolController,
                              keyboardType: TextInputType.text,
                            ),
                            ProfileTextFeild(
                              icon: const Icon(
                                Icons.cast_for_education,
                                color: Colors.black,
                              ),
                              displaytText: 'Education 12th'.toUpperCase(),
                              controller: _interMediateController,
                              keyboardType: TextInputType.text,
                            ),
                            ProfileTextFeild(
                              icon: const Icon(
                                Icons.cast_for_education,
                                color: Colors.black,
                              ),
                              displaytText:
                                  'Education Graduation'.toUpperCase(),
                              controller: _graduationController,
                              keyboardType: TextInputType.text,
                            ),
                            ProfileTextFeild(
                              icon: const Icon(
                                Icons.cast_for_education,
                                color: Colors.black,
                              ),
                              displaytText:
                                  'Education Post Graduation'.toUpperCase(),
                              controller: _postGraduationController,
                              keyboardType: TextInputType.text,
                            ),
                          ],
                        )
                      : const SizedBox(),
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
                          if (widget.isUpdate) {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _isLoading = true;
                              });
                              await UserRepository().updateUserProfile(
                                {
                                  'name': _nameController.text.trim(),
                                  'email': _emailController.text.trim(),
                                  'mobile_number': _phoneController.text.trim(),
                                  'gender': _selectedGender,
                                  'highschool':
                                      _highSchoolController.text.trim(),
                                  'intermediate':
                                      _interMediateController.text.trim(),
                                  'gradution':
                                      _graduationController.text.trim(),
                                  'post_gradution':
                                      _postGraduationController.text.trim(),
                                  'adhar_number':
                                      _aadhaarCardController.text.trim(),
                                  'passport_number':
                                      _passPortController.text.trim(),
                                  'gotra_id': _selectedGotra.id,
                                  'country_id': _selectedCountry.id,
                                  'state_id': _selectedState.id,
                                  'district_id': _selectedDistrict.id,
                                  'city_id': _selectedCity.id,
                                  'pincode_id': _selectedPincode.id,
                                  'address': _addressController.text.trim(),
                                },
                                _selectedImage,
                              );
                              setState(() {
                                _isLoading = false;
                              });
                              final res = await StorageService()
                                  .saveUser(_phoneController.text.trim());
                              print('Response is $res');
                              if (res) {
                                Navigator.pop(context);
                              }
                            }
                          } else {
                            if (_formKey.currentState!.validate() &&
                                !imageError) {
                              setState(() {
                                _isLoading = true;
                              });
                              await UserRepository().userRegistration(
                                {
                                  'name': _nameController.text.trim(),
                                  'mobile_number': _phoneController.text.trim(),
                                  'email': _emailController.text.trim(),
                                  'adhar_number':
                                      _aadhaarCardController.text.trim(),
                                  'passport_number':
                                      _passPortController.text.trim(),
                                  'state_id': _selectedState.id,
                                  'district_id': _selectedDistrict.id,
                                  'city_id': _selectedCity.id,
                                  'pincode_id': _selectedPincode.id,
                                  'community_id': _selectedCommunity.id,
                                  'gender': _selectedGender,
                                  'address': _addressController.text.trim(),
                                  'country_id': _selectedCountry.id,
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
                          }
                        },
                        child: Text(
                          widget.isUpdate ? 'SAVE' : "NEXT",
                          style: const TextStyle(
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
