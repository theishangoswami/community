import 'package:community_internal/app/locator.dart';
import 'package:community_internal/core/services/key_storage.service.dart';
import 'package:community_internal/ui/onboarding/login_page.dart';
import 'package:community_internal/ui/screens/ads_screen.dart';
import 'package:community_internal/ui/screens/community_feed_fb.dart';
import 'package:community_internal/ui/screens/community_list.dart';
import 'package:community_internal/ui/screens/create_post.dart';
import 'package:community_internal/ui/screens/ledger.dart';
import 'package:community_internal/ui/screens/members_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

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
      // home: const OnboardingScreen(),
      home: StorageService().isUserLoggedIn()
          ? const CommunityList()
          : const LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
        children: const [
          CommunityFeedFb(),
          MembersScreen(),
          CreatePost(),
          Ledger(),
          AdsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle:
            const TextStyle(color: Color.fromARGB(255, 54, 20, 20)),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
          _pageController.jumpToPage(index);
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
