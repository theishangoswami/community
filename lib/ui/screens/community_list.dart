import 'package:community_internal/app/locator.dart';
import 'package:community_internal/core/models/community.model.dart';
import 'package:community_internal/core/repository/community.repo.dart';
import 'package:community_internal/main.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/dummy_drawer.dart';
import '../widgets/user_avatar.dart';
import 'member_profile.dart';

class CommunityList extends StatefulWidget {
  const CommunityList({Key? key}) : super(key: key);

  @override
  _CommunityListState createState() => _CommunityListState();
}

class _CommunityListState extends State<CommunityList> {
  final CommunityRepository _communityRepository = CommunityRepository();
  List<CommunityModel> communityList = [];
  @override
  void initState() {
    super.initState();
    fetchCommunityList();
  }

  bool isBusy = false;
  fetchCommunityList() async {
    final SharedPreferences _sharedPreferences = locator<SharedPreferences>();
    final communityId = _sharedPreferences.getString('communityId');
    setState(() {
      isBusy = true;
    });
    communityList = (await _communityRepository.getCommunityList(communityId!))
        // .where((CommunityModel e) => e.status == 'apporoved')
        .toList();
    setState(() {
      isBusy = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LoadingHelper(
          isLoading: isBusy,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "All Communities".toUpperCase(),
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
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 30),
                    child: Text(
                      'Join your community'.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CommunityTileCustom(
                            communityModel: communityList[index],
                          );
                        },
                        itemCount: communityList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 10,
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height * 0.75),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: FloatingActionButton(
                  onPressed: () async {
                    var url = Uri.parse("https://www.youtube.com/");
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Icon(Icons.add)),
            )),
      ],
    );
  }
}

// class CommunityTile extends StatelessWidget {
//   const CommunityTile({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         top: 5.0,
//         bottom: 10,
//       ),
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.75,
//         height: 75,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Color(0xFFFE580C),
//               Color(0xFFD22CD8),
//             ],
//           ),
//           color: Color(0xFF21242B),
//           borderRadius: BorderRadius.all(
//             Radius.circular(30),
//           ),
//           // border: Border.all(
//           //   color: const Color(0xFFFE580C),
//           // ),
//         ),
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             primary: Colors.amberAccent,
//             elevation: 8.0,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(18.0),
//               side: const BorderSide(
//                 color: Colors.grey,
//               ),
//             ),
//           ),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const MyHomePage(),
//               ),
//             );
//           },
//           child: const CommunityTileCustom(),
//         ),
//       ),
//     );
//   }
// }

class CommunityTileCustom extends StatelessWidget {
  final CommunityModel communityModel;
  const CommunityTileCustom({Key? key, required this.communityModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              communityModel.societyLogo ??
                  "https://media.istockphoto.com/vectors/crowd-of-young-and-elderly-men-and-women-in-trendy-hipster-clothes-vector-id1288712636?s=612x612",
              // height: MediaQuery.of(context).size.height * 0.15,
              // fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              communityModel.societyName?.toUpperCase() ?? "NA",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              (communityModel.person ?? "0").toString() + " members",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // if (communityModel.status == "apporoved")
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ButtonTheme(
              height: 26,
              minWidth: double.infinity,
              child: Center(
                child: MaterialButton(
                  color: Colors.amber,
                  child: Text(
                    "Join".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () async {
                    await locator<SharedPreferences>()
                        .setString('societyId', communityModel.id ?? "");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyHomePage(),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class CommunityTileCustom extends StatelessWidget {
//   const CommunityTileCustom({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: const [
//               Text(
//                 "2500",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blueGrey,
//                 ),
//               ),
//               Icon(
//                 Icons.group,
//                 color: Colors.grey,
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 75,
//             child: VerticalDivider(color: Colors.white),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Community Name".toUpperCase(),
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueGrey,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     "Brahmin".toUpperCase(),
//                     style: const TextStyle(
//                       fontSize: 13,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             width: 5,
//           ),
//           const Icon(
//             Icons.arrow_forward_sharp,
//             size: 25,
//             color: Colors.blueGrey,
//           ),
//         ],
//       ),
//     );
//   }
// }
