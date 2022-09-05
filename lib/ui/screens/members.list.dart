import 'package:community_internal/core/models/user_model.dart';
import 'package:community_internal/gen/assets.gen.dart';
import 'package:community_internal/ui/screens/inbox.dart';
import 'package:flutter/material.dart';

class MembersGridList extends StatefulWidget {
  final List<UserModel> userList;
  const MembersGridList({Key? key, required this.userList}) : super(key: key);

  @override
  State<MembersGridList> createState() => _MembersGridListState();
}

class _MembersGridListState extends State<MembersGridList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 20.0,
        childAspectRatio: (MediaQuery.of(context).size.width) /
            (MediaQuery.of(context).size.height / 1.4),
      ),
      itemCount: widget.userList.length,
      itemBuilder: (context, index) {
        var user = widget.userList.elementAt(index);
        return Material(
          elevation: 8.0,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          shadowColor: Colors.black.withOpacity(0.8),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: user.profile?.isEmpty ?? true
                            ? AssetImage(
                                Assets.images.person.path,
                              )
                            : Image.network(user.profile!).image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.bottomRight,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatBox(
                                  recieverId: user.id!,
                                  chatHeadName: user.userName ?? '',
                                  profileImageurl: user.profile ?? '',
                                ),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.message,
                            color: Colors.amber,
                          ),
                        ),
                      )),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (user.userName ?? "NA").toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      (user.mobileNumber ?? "").toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      (user.userEmail ?? "NA").toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
