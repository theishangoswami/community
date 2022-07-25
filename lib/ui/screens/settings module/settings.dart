import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';


class Setting extends StatefulWidget {
  const Setting ({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Settings".toUpperCase(),style: TextStyle(color:Colors.black),),),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('Common'.toUpperCase().toUpperCase(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color:Colors.amber),),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: GestureDetector(
                    onTap: (){
                    },
                    child: Text('Change Language'.toUpperCase(),style: TextStyle(fontSize: 17,),)),
                value: Text('English'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.photo),
                title: Text('Quotes'.toUpperCase(),style: TextStyle(fontSize: 17),),
                value: Text('Protected'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.person_pin_sharp),
                title: Text('Create your sanstha /group /community'.toUpperCase(),style: TextStyle(fontSize: 16),),
                value: Text('Default'),
              ),
            ],
          ),
          SettingsSection(
            title: Text('About '.toUpperCase(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color:Colors.amber),),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.indeterminate_check_box),
                title: Text('Privacy Policy'.toUpperCase(),style: TextStyle(fontSize: 17),),
                // value: Text('English'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.document_scanner_rounded),
                title: Text('Terms & Condition'.toUpperCase(),style: TextStyle(fontSize: 17),),
                // value: Text('English'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.share),
                title: Text('Share with family and friends.'.toUpperCase(),style: TextStyle(fontSize: 17),),
                // value: Text('English'),
              ),
            ],
          ),
          SettingsSection(
            title: Text('Account'.toUpperCase(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color:Colors.amber),),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.star_rate),
                title: Text('Rate us on Playstore'.toUpperCase(),style: TextStyle(fontSize: 17),),
                // value: Text('English'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.bug_report),
                title: Text("Report a Bug".toUpperCase(),style: TextStyle(fontSize: 17),),
                // value: Text('English'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.logout),
                title: Text('Sign Out'.toUpperCase(),style: TextStyle(fontSize: 17),),
                // value: Text('English'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

