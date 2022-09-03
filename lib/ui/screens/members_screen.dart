import 'package:community_internal/core/models/city.dart';
import 'package:community_internal/core/models/pincode.dart';
import 'package:community_internal/core/models/user_model.dart';
import 'package:community_internal/core/repository/users.repository.dart';
import 'package:community_internal/core/services/key_storage.service.dart';
import 'package:community_internal/ui/screens/member_page/filter.dart';
import 'package:community_internal/ui/screens/member_page/search.dart';
import 'package:community_internal/ui/screens/member_profile.dart';
import 'package:community_internal/ui/screens/members.list.dart';
import 'package:community_internal/ui/widgets/user_avatar.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MembersScreen extends StatefulWidget {
  const MembersScreen({Key? key}) : super(key: key);

  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  List<UserModel> _userList = [];
  final List<Pincode> _pinCodeList = [
    Pincode(pinCode: "Please select a pincode", id: "-1", cityId: ''),
  ];
  Pincode _selectedPincode =
      Pincode(pinCode: "Please select a pincode", id: "-1", cityId: '');
  final List<City> _cityList = [
    City(cityName: "Please select a city", id: "-1", districtId: '-1'),
  ];
  City _selectedCity =
      City(cityName: "Please select a city", id: "-1", districtId: '-1');
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchDetails();
  }

  void fetchDetails() async {
    setState(() {
      _isLoading = true;
    });
    _userList = await UserRepository().getAllUsers();
    await UserRepository().getCity().then((value) {
      _cityList.addAll(value!);
    });
    await UserRepository().getPincode().then((value) {
      _pinCodeList.addAll(value!);
    });
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = StorageService().getCurrentUser();
    return LoadingHelper(
      isLoading: _isLoading,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Members".toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                child: UserAvatar(
                  radius: 50,
                  imgUrl: user!.profile!,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MemberProfileScreen(),
                    ),
                  );
                },
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TabHeading(
                    iconName: FontAwesomeIcons.locationDot,
                    title: 'City',
                    onTap: () {
                      showFilterSheet(
                        context,
                        showPinCodeField: false,
                        selectedCity: _selectedCity,
                        cityList: _cityList,
                        onCityChanged: (City? newValue) {
                          setState(() {
                            _selectedCity = newValue!;
                          });
                        },
                        onPressed: () {},
                      );
                    },
                  ),
                  TabHeading(
                    iconName: FontAwesomeIcons.map,
                    title: 'Pin code',
                    onTap: () {
                      showFilterSheet(
                        context,
                        showPinCodeField: true,
                        pinCodeList: _pinCodeList,
                        selectedPincode: _selectedPincode,
                        onPinCodeChanged: (Pincode? newValue) {
                          setState(() {
                            _selectedPincode = newValue!;
                          });
                        },
                        onPressed: () {},
                      );
                    },
                  ),
                  TabHeading(
                    iconName: FontAwesomeIcons.searchengin,
                    title: 'Search',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SearchPage(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        body: MembersGridList(
          userList: _userList,
        ),
      ),
    );
  }
}

class TabHeading extends StatelessWidget {
  final String title;
  final IconData iconName;
  final void Function()? onTap;
  const TabHeading({
    Key? key,
    required this.title,
    required this.iconName,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            iconName,
            size: 28,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title.toUpperCase(),
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
