import 'package:community_internal/ui/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/line_space.dart';

class DummyDrawer extends StatelessWidget {
  const DummyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 15,
      backgroundColor: Colors.grey,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                UserAvatar(radius: 115),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Text(
                    'shivam'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const LineSpace(),
          ListTile(
            title: Text('Settings'.toUpperCase()),
            leading: const Icon(Icons.settings),
            onTap: () {},
          ),
          ListTile(
            title: Text('About the app'.toUpperCase()),
            leading: const Icon(FontAwesomeIcons.film),
            onTap: () {},
          ),
          const LineSpace(),
          ListTile(
            title: Text('Developers'.toUpperCase()),
            leading: const Icon(FontAwesomeIcons.laptopCode),
            onTap: () {},
          ),
          ListTile(
            title: Text('Share the app'.toUpperCase()),
            leading: const Icon(Icons.share),
            onTap: () {},
          ),
          ListTile(
            title: Text('Rate the app'.toUpperCase()),
            leading: const Icon(FontAwesomeIcons.star),
            onTap: () {},
          ),
          ListTile(
            title: Text('Check for updates'.toUpperCase()),
            leading: const Icon(FontAwesomeIcons.googlePlay),
            onTap: () {},
          ),
          const LineSpace(),
          ListTile(
            title: Text('Report a bug'.toUpperCase()),
            leading: const Icon(FontAwesomeIcons.bug),
            onTap: () {},
          ),
          ListTile(
            title: Text('Contact Us'.toUpperCase()),
            leading: const Icon(FontAwesomeIcons.solidEnvelope),
            onTap: () {},
          ),
          const LineSpace(),
          ListTile(
            title: Text('Privacy policy'.toUpperCase()),
            leading: const Icon(Icons.privacy_tip),
            onTap: () {},
          ),
          ListTile(
            title: Text('View Licenses'.toUpperCase()),
            leading: const Icon(FontAwesomeIcons.bookOpen),
            onTap: () {},
          ),
          const LineSpace(),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Center(
              child: Text('Community v-0.0.1'.toUpperCase()),
            ),
          ),
        ],
      ),
    );
  }
}
