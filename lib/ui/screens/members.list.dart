import 'package:community_internal/gen/assets.gen.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/material.dart';

import '../../core/models/user.model.dart';
import '../../core/repository/users.repository.dart';

class MembersGridList extends StatefulWidget {
  const MembersGridList({Key? key}) : super(key: key);

  @override
  State<MembersGridList> createState() => _MembersGridListState();
}

class _MembersGridListState extends State<MembersGridList> {
  List<UserModel> usersList = [];
  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  fetchUsers() async {
    setState(() {
      isBusy = true;
    });

    usersList = await UserRepository().getAllUsers();
    setState(() {
      isBusy = false;
    });
  }

  bool isBusy = false;

  @override
  Widget build(BuildContext context) {
    return LoadingHelper(
      isLoading: isBusy,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 25.0,
              childAspectRatio: (MediaQuery.of(context).size.width) /
                  (MediaQuery.of(context).size.height / 1.4),
            ),
            itemCount: usersList.length,
            itemBuilder: (context, index) {
              var user = usersList.elementAt(index);
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Material(
                  elevation: 8.0,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  shadowColor: Colors.amber.withOpacity(0.8),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                Assets.images.userIcon.path,
                              ),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                (user.userName ?? "NA").toUpperCase(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                (user.mobileNumber ?? "").toUpperCase(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              Text(
                                (user.userEmail ?? "NA").toUpperCase(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
