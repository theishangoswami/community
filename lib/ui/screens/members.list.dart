import 'package:community_internal/core/models/city.dart';
import 'package:community_internal/core/models/user_model.dart';
import 'package:community_internal/gen/assets.gen.dart';
import 'package:community_internal/ui/screens/inbox.dart';
import 'package:flutter/material.dart';

class MembersGridList extends StatefulWidget {
  final List<UserModel> userList;
  final List<City> cityList;
  const MembersGridList({
    Key? key,
    required this.userList,
    this.cityList = const [],
  }) : super(key: key);

  @override
  State<MembersGridList> createState() => _MembersGridListState();
}

class _MembersGridListState extends State<MembersGridList> {
  @override
  Widget build(BuildContext context) {
    return widget.userList.isNotEmpty
        ? GridView.builder(
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
              final cityName = user.cityId?.isNotEmpty ?? false
                  ? widget.cityList.isNotEmpty
                      ? widget.cityList
                          .where((element) => element.id == user.cityId)
                          .first
                          .cityName
                      : null
                  : null;
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
                            (user.userName ?? "Name").toUpperCase(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.blueGrey,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            (user.societyName ?? "Society Name").toUpperCase(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.blueGrey,
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            (cityName ?? "City Name").toUpperCase(),
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
          )
        : const Center(child: Text('No Search Found'));
  }
}
