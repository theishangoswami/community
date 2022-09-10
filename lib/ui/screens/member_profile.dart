import 'package:community_internal/core/models/user_model.dart';
import 'package:community_internal/core/services/key_storage.service.dart';
import 'package:community_internal/ui/screens/ledger%20module/ledger_page.dart';
import 'package:community_internal/ui/screens/messaging.dart';
import 'package:community_internal/ui/screens/settings%20module/invite_friends.dart';
import 'package:community_internal/ui/screens/settings%20module/member_details.dart';
import 'package:community_internal/ui/screens/settings%20module/settings.dart';
import 'package:community_internal/ui/screens/settings%20module/user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/user_avatar.dart';

class MemberProfileScreen extends StatefulWidget {
  const MemberProfileScreen({Key? key}) : super(key: key);

  @override
  State<MemberProfileScreen> createState() => _MemberProfileScreenState();
}

class _MemberProfileScreenState extends State<MemberProfileScreen> {
  final StorageService _storageService = StorageService();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
// <<<<<<< HEAD
    final user = StorageService().getCurrentUser();
// =======
//     UserModel user = _storageService.getCurrentUser()!;
// >>>>>>> 7318728b3f0bc619ed3527d5eca08fef36a38d88
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
                  height: 10,
                ),
                const Divider(),
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
                          tag: 'add family member',
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
                              builder: (context) => const Page1(),
                            ),
                          );
                        },
                        child: const CustomCard(
                          icon: (FontAwesomeIcons.personCirclePlus),
                          tag: 'member add',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Page1(),
                            ),
                          );
                        },
                        child: const CustomCard(
                          icon: (FontAwesomeIcons.star),
                          tag: 'mahamemeber',
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          var url = Uri.parse(
                            "https://akhilbhartiyasamaj.com/board_member_screen.php?user_id=${user.id}",
                          );
                          if (await canLaunchUrl(url)) {
                            await launchUrl(
                              url,
                              mode: LaunchMode.inAppWebView,
                            );
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: const CustomCard(
                          icon: (Icons.groups),
                          tag: 'board member',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Page1(),
                            ),
                          );
                        },
                        child: const CustomCard(
                          icon: (Icons.wallpaper),
                          tag: 'wallpaper',
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          var url = Uri.parse(
                            "https://akhilbhartiyasamaj.com/add_notice_mobile.php?user_id=${user.id}",
                          );
                          if (await canLaunchUrl(url)) {
                            await launchUrl(
                              url,
                              mode: LaunchMode.inAppWebView,
                            );
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: const CustomCard(
                          icon: (Icons.mail),
                          tag: 'Notice',
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {},
                        child: const CustomCard(
                          icon: (Icons.document_scanner),
                          tag: 'documents',
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          var url = Uri.parse(
                            "https://akhilbhartiyasamaj.com/id_card.php?user_id=${user.id}",
                          );
                          if (await canLaunchUrl(url)) {
                            await launchUrl(
                              url,
                              mode: LaunchMode.inAppWebView,
                            );
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: const CustomCard(
                          icon: (Icons.badge),
                          tag: 'id card',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Page1(),
                            ),
                          );
                        },
                        child: const CustomCard(
                          icon: (Icons.volunteer_activism),
                          tag: 'donation',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Page1(),
                            ),
                          );
                        },
                        child: const CustomCard(
                          icon: (Icons.language),
                          tag: 'language',
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          var url = Uri.parse(
                            "https://akhilbhartiyasamaj.com/join_society_app.php?user_id=${user.id}",
                          );
                          if (await canLaunchUrl(url)) {
                            await launchUrl(
                              url,
                              mode: LaunchMode.inAppWebView,
                            );
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: const CustomCard(
                          icon: (Icons.switch_account),
                          tag: 'join society',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Page1(),
                            ),
                          );
                        },
                        child: const CustomCard(
                          icon: (Icons.privacy_tip),
                          tag: 'privacy policy',
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          var url = Uri.parse(
                            "https://akhilbhartiyasamaj.com/term_and_condition_screen.php",
                          );
                          if (await canLaunchUrl(url)) {
                            await launchUrl(
                              url,
                              mode: LaunchMode.inAppWebView,
                            );
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: const CustomCard(
                          icon: (Icons.newspaper),
                          tag: 'Terms & Conditions',
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          var url = Uri.parse(
                            "https://akhilbhartiyasamaj.com/complaint_and_suggestion.php",
                          );
                          if (await canLaunchUrl(url)) {
                            await launchUrl(
                              url,
                              mode: LaunchMode.inAppWebView,
                            );
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: const CustomCard(
                          icon: (Icons.delete_forever),
                          tag: 'Complaints',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Page1(),
                            ),
                          );
                        },
                        child: const CustomCard(
                          icon: (Icons.rate_review),
                          tag: 'Rate us',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Page1(),
                            ),
                          );
                        },
                        child: const CustomCard(
                          icon: (Icons.report),
                          tag: 'report',
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
            Center(
              child: Text(
                tag.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
