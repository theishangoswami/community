import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:community_internal/data/models/post_model.dart';
import 'package:community_internal/data/models/user_model.dart';
import 'package:community_internal/ui/onboarding/login_page.dart';
import 'package:community_internal/ui/screens/community_feed.dart';
import 'package:community_internal/ui/screens/community_feed_fb.dart';
import 'package:community_internal/ui/screens/community_list.dart';
import 'package:community_internal/ui/screens/create_post.dart';
import 'package:community_internal/ui/screens/member_profile.dart';
import 'package:community_internal/ui/screens/members_screen.dart';
import 'package:community_internal/ui/screens/onboarding_screen.dart';
import 'package:community_internal/ui/widgets/post_container.dart';
import 'package:community_internal/ui/screens/screen_demo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp()
      .then((value) => print("Connected to Firebase 🚀"));
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
      home: const LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
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
          setState(() => _currentIndex = index);
        },
        children: const [
          CommunityFeedFb(),
          MembersScreen(),
          CreatePost(),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.home_filled),
            title: Text('Home'.toUpperCase()),
            activeColor: Colors.black87,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.people),
            title: Text('Members'.toUpperCase()),
            activeColor: Colors.black87,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.create_outlined),
            title: Text(
              'Create Post'.toUpperCase(),
            ),
            activeColor: Colors.black87,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.work),
            title: Text('Jobs'.toUpperCase()),
            activeColor: Colors.black87,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.ads_click),
            title: Text('Ads'.toUpperCase()),
            activeColor: Colors.black87,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
