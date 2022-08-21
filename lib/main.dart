import 'dart:async';

import 'package:community_internal/app/locator.dart';
import 'package:community_internal/core/services/key_storage.service.dart';
import 'package:community_internal/ui/screens/ads_screen.dart';
import 'package:community_internal/ui/screens/community_feed_fb.dart';
import 'package:community_internal/ui/screens/community_list.dart';
import 'package:community_internal/ui/screens/create_post.dart';
import 'package:community_internal/ui/screens/job_list.dart';
import 'package:community_internal/ui/screens/members_screen.dart';
import 'package:community_internal/ui/screens/verification_ui.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui/screens/app start module/language.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  try {
    await Firebase.initializeApp()
        .then((value) => print("Connected to Firebase"));
  } catch (e) {}

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Community Internal',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'Caladea',
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void fetchCurrentUser() async {
    if (StorageService().isUserLoggedIn()) {
      final SharedPreferences _sharedPreference = locator<SharedPreferences>();
      await StorageService()
          .saveUser(_sharedPreference.getString('phoneNumber').toString());
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCurrentUser();
    final user = StorageService().getCurrentUser();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return StorageService().isUserLoggedIn()
                ? user?.status?.startsWith('e') ?? false
                    ? user?.societyId?.isNotEmpty ?? false
                        ? MyHomePage(
                            societyId: user!.societyId!,
                            societyName: locator<SharedPreferences>()
                                    .getString('societyName') ??
                                '',
                          )
                        : const CommunityList()
                    : VerifyPage(phonenumber: user!.mobileNumber.toString())
                : const LanguagePage();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      color: Colors.amber,
      child: const Center(
        child: Icon(Icons.ac_unit_sharp, color: Colors.white, size: 90),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String societyId;
  final String societyName;
  const MyHomePage(
      {Key? key, required this.societyId, required this.societyName})
      : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  List _pages = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      CommunityFeedFb(
        societyId: widget.societyId,
        societyName: widget.societyName,
      ),
      const MembersScreen(),
      const CreatePost(),
      const JobList(),
      AdsScreen(
        societyId: widget.societyId,
        societyName: widget.societyName,
      ),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle:
            const TextStyle(color: Color.fromARGB(255, 54, 20, 20)),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _pageController.jumpToPage(
            index,
          );
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? Colors.amber : Colors.grey,
            ),
            label: "Home".toUpperCase(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _selectedIndex == 1 ? Colors.amber : Colors.grey,
            ),
            label: 'Members'.toUpperCase(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.post_add,
              color: _selectedIndex == 2 ? Colors.amber : Colors.grey,
            ),
            label: 'Post'.toUpperCase(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
              color: _selectedIndex == 3 ? Colors.amber : Colors.grey,
            ),
            label: 'Jobs'.toUpperCase(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet_rounded,
              color: _selectedIndex == 4 ? Colors.amber : Colors.grey,
            ),
            label: 'Ads'.toUpperCase(),
          ),
        ],
      ),
    );
  }
}
