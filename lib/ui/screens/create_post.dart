import 'package:community_internal/ui/widgets/dummy_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/user_avatar.dart';
import 'member_profile.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  bool isAd = true;
  TextEditingController messageTEC = TextEditingController();
  String messageText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DummyDrawer(),
      appBar: AppBar(
        title: Text(
          "Post".toUpperCase(),
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
              child: const UserAvatar(
                radius: 50,
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
      ),
      body: ListTile(
        leading: const UserAvatar(
          radius: 70,
        ),
        title: Text(
          "Sunil Pandey".toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          "Secretary".toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      bottomSheet: BottomSheet(
        enableDrag: false,
        builder: (BuildContext context) {
          return Material(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            elevation: 18,
            type: MaterialType.card,
            child: Container(
              alignment: Alignment.center,
              // color: Colors.grey,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.camera_alt_sharp,
                        color: Colors.lightGreen,
                      ),
                      title: Text("Camera".toUpperCase()),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.photo,
                        color: Colors.blue,
                      ),
                      title: Text("Photo".toUpperCase()),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.video_call,
                        color: Colors.orangeAccent,
                      ),
                      title: Text("Video".toUpperCase()),
                    ),
                    ListTile(
                      leading: const Icon(
                        FontAwesomeIcons.youtube,
                        color: Colors.red,
                      ),
                      title: Text("Youtube Link".toUpperCase()),
                    ),
                    ListTile(
                      trailing: Switch(
                        value: isAd,
                        onChanged: (val) {
                          setState(() {
                            isAd = val;
                          });
                        },
                        activeColor: Colors.amber,
                        activeTrackColor: Colors.lightBlueAccent,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Post as an Advertisement".toUpperCase(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border(
                            top: BorderSide(
                              color: Colors.amber,
                              width: 2.0,
                            ),
                            left: BorderSide(
                              color: Colors.amber,
                              width: 2.0,
                            ),
                            bottom: BorderSide(
                              color: Colors.amber,
                              width: 2.0,
                            ),
                            right: BorderSide(
                              color: Colors.amber,
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                controller: TextEditingController(),
                                onChanged: (value) {
                                  //Do something with the user input.
                                  messageText = value;
                                },
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  hintText: 'Type your thoughts here...',
                                  hintStyle: TextStyle(color: Colors.black38),
                                  border: InputBorder.none,
                                ),
                                style: const TextStyle(color: Colors.black87),
                              ),
                            ),
                            // ignore: deprecated_member_use
                            FlatButton(
                              onPressed: () {
                                //Implement send functionality.
                                messageTEC.clear();
                              },
                              child: Text(
                                'Post'.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.lightBlueAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        onClosing: () {},
      ),
    );
  }
}
