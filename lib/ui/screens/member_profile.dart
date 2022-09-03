import 'package:community_internal/core/services/key_storage.service.dart';
import 'package:community_internal/ui/screens/ledger%20module/ledger_page.dart';
import 'package:community_internal/ui/screens/messaging.dart';
import 'package:community_internal/ui/screens/settings%20module/invite_friends.dart';
import 'package:community_internal/ui/screens/settings%20module/member_details.dart';
import 'package:community_internal/ui/screens/settings%20module/settings.dart';
import 'package:community_internal/ui/screens/settings%20module/user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/user_avatar.dart';

class MemberProfileScreen extends StatelessWidget {
  const MemberProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = StorageService().getCurrentUser();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: UserAvatar(
              radius: 60,
              imgUrl: user!.profile,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                UserAvatar(
                  radius: 140,
                  imgUrl: user.profile,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LedgerPage(),
                            ),
                          ),
                        },
                        child: const CustomCard(
                          icon: (FontAwesomeIcons.addressBook),
                          tag: 'ledger',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Messaging(),
                            ),
                          );
                        },
                        child: const CustomCard(
                          icon: (FontAwesomeIcons.message),
                          tag: 'message',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MultiForm(),
                            ),
                          );
                        },
                        child: const CustomCard(
                          icon: (FontAwesomeIcons.userGroup),
                          tag: 'member',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          final user = StorageService().getCurrentUser();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserDetails(
                                phoneNumber: user!.mobileNumber!,
                                isUpdate: true,
                              ),
                            ),
                          );
                        },
                        child: const CustomCard(
                          icon: (FontAwesomeIcons.person),
                          tag: 'profile',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Setting(),
                            ),
                          );
                        },
                        child: const CustomCard(
                          icon: (Icons.settings),
                          tag: 'settings',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Page1(),
                            ),
                          );
                        },
                        child: const CustomCard(
                          icon: (FontAwesomeIcons.personCirclePlus),
                          tag: 'member add ',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.icon, required this.tag})
      : super(key: key);
  final IconData icon;
  final String tag;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 10,
        shadowColor: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 70,
              color: const Color(0xFFFFB800),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              tag.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
