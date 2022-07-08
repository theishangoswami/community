import 'dart:io';

import 'package:community_internal/app/locator.dart';
import 'package:community_internal/core/models/post.model.dart';
import 'package:community_internal/core/models/user.model.dart';
import 'package:community_internal/core/repository/post_repository.dart';
import 'package:community_internal/core/services/file.service.dart';
import 'package:community_internal/ui/widgets/dummy_drawer.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/services/key_storage.service.dart';
import '../widgets/user_avatar.dart';
import 'member_profile.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final PostRepository _postRepository = PostRepository();
  final FilePickerService _filePickerService = FilePickerService();
  final SharedPreferences _sharedPreferences = locator<SharedPreferences>();
  File? file;
  int? type;
  bool isAd = true;
  TextEditingController messageTEC = TextEditingController();
  TextEditingController descController = TextEditingController();
  String messageText = '';
  final StorageService _storageService = StorageService();
  bool isBusy = false;
  createPost() async {
    UserModel user = _storageService.getCurrentUser();

    try {
      setState(() {
        isBusy = true;
      });
      bool res = await _postRepository.createPost(
        PostModel(
          userId: user.id,
          societyId: _sharedPreferences.getString('societyId'),
          status: 'enable',
          typeOfPost: type?.toString(),
          postLink: type == 4 ? messageTEC.text.trim() : "image",
          postDescription: descController.text,
          ads: isAd ? "1" : "0",
        ),
        image: type == 4 ? null : (await file?.readAsBytes()),
      );
      setState(() {
        isBusy = false;
      });
      if (res) {
        messageTEC.clear();
        Fluttertoast.showToast(msg: "Post created successfully");
      }
    } catch (e) {
      debugPrint("$e");
    }
  }

  shwoDialog() async {
    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Add Youtube link"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                messageTEC.clear();
                setState(() {
                  type = null;
                });
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.black45),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  type = 4;
                });
              },
              child: const Text("Add"),
            )
          ],
          content: TextFormField(
            controller: messageTEC,
            decoration: const InputDecoration(labelText: "Youtube link"),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LoadingHelper(
      isLoading: isBusy,
      child: Scaffold(
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
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () async {
                          var file =
                              await _filePickerService.pickImageFromCamera();
                          setState(() {
                            this.file = file;
                            type = 1;
                          });
                        },
                        leading: const Icon(
                          Icons.camera_alt_sharp,
                          color: Colors.lightGreen,
                        ),
                        title: Text("Camera".toUpperCase()),
                      ),
                      ListTile(
                        onTap: () async {
                          var file =
                              await _filePickerService.pickImageFromGallery();
                          setState(() {
                            this.file = file;
                            type = 2;
                          });
                        },
                        leading: const Icon(
                          Icons.photo,
                          color: Colors.blue,
                        ),
                        title: Text("Photo".toUpperCase()),
                      ),
                      ListTile(
                        onTap: () async {
                          var file = await _filePickerService.pickVideo();
                          setState(() {
                            this.file = file;
                            type = 3;
                          });
                        },
                        leading: const Icon(
                          Icons.video_call,
                          color: Colors.orangeAccent,
                        ),
                        title: Text("Video".toUpperCase()),
                      ),
                      ListTile(
                        onTap: () {
                          shwoDialog();
                        },
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
                                  controller: descController,
                                  onChanged: (value) {
                                    //Do something with the user input.
                                    messageText = value;
                                  },
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 20.0,
                                    ),
                                    hintText: 'Type your thoughts here...',
                                    hintStyle: TextStyle(color: Colors.black38),
                                    border: InputBorder.none,
                                  ),
                                  style: const TextStyle(color: Colors.black87),
                                ),
                              ),
                              // ignore: deprecated_member_use
                              FlatButton(
                                onPressed: () async {
                                  createPost();
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
      ),
    );
  }
}
