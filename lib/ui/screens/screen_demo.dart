import 'package:community_internal/ui/screens/community_feed.dart';
import 'package:community_internal/ui/screens/community_feed_fb.dart';
import 'package:community_internal/ui/screens/community_list.dart';
import 'package:community_internal/ui/screens/create_post.dart';
import 'package:community_internal/ui/screens/member_profile.dart';
import 'package:community_internal/ui/screens/members_screen.dart';
import 'package:community_internal/ui/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class ScreenDemo extends StatefulWidget {
  const ScreenDemo({Key? key}) : super(key: key);

  @override
  _ScreenDemoState createState() => _ScreenDemoState();
}

class _ScreenDemoState extends State<ScreenDemo> {
  final List screens = [
    const CommunityList(),
    const OnboardingScreen(),
    // const CommunityFeedFb(),
    const CommunityFeed(),
    const CreatePost(),
    const MembersScreen(),
    const MemberProfileScreen(),
  ];
  final List screenNames = [
    'Community List',
    'Onboarding',
    'Feed(Facebook Style)',
    'Feed(Instagram Style)',
    'Create Post',
    'Members',
    'Member Profile'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screens Demo"),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => screens[index],
                        ),
                      );
                    },
                    child: Text(screenNames[index]),
                  ),
                );
              },
              separatorBuilder: (ctx, i) => const SizedBox(
                height: 25,
              ),
              itemCount: screens.length,
            ),
          ),
        ),
      ),
    );
  }
}
