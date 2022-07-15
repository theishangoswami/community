// import 'package:community_internal/ui/screens/community_list.dart';
// import 'package:community_internal/ui/screens/profile.dart';
// import 'package:flutter/material.dart';
//
// import '../widgets/dummy_drawer.dart';
//
//
// List gender = ["Male", "Female", "Other"];
// late String select;
//
// class Profile extends StatefulWidget {
//   const Profile({Key? key}) : super(key: key);
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   String _selectedGender = 'male';
//   List<Icon> icons = const [
//     Icon(
//       Icons.person,
//       color: Colors.black,
//     ),
//     Icon(
//       Icons.person,
//       color: Colors.black,
//     ),
//     Icon(
//       Icons.phone_android,
//       color: Colors.black,
//     ),
//     Icon(
//       Icons.attach_email,
//       color: Colors.black,
//     ),
//     Icon(
//       Icons.countertops,
//       color: Colors.black,
//     ),
//     Icon(
//       Icons.map_outlined,
//       color: Colors.black,
//     ),
//     Icon(
//       Icons.location_on_sharp,
//       color: Colors.black,
//     ),
//     Icon(
//       Icons.book_outlined,
//       color: Colors.black,
//     ),
//     Icon(Icons.vertical_split, color: Colors.black),
//     Icon(Icons.add_card_outlined, color: Colors.black),
//     Icon(Icons.airplanemode_active, color: Colors.black),
//   ];
//   List<String> datas = [
//     "",
//     "Name",
//     "pHONE Number",
//     "Email",
//     "State",
//     "District",
//     "town",
//     "Address",
//     "Religion",
//     "Aadhar card number",
//     "passport number"
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("User Details"),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//               child: ListView.builder(
//                   itemCount: 11,
//                   itemBuilder: (context, index) {
//                     return index == 0
//                         ? Stack(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(12),
//                           child: Align(
//                             alignment: Alignment.topLeft,
//                             child: CircleAvatar(
//                               radius: 70,
//                               backgroundColor: Colors.black,
//                               child: CircleAvatar(
//                                 backgroundColor: Colors.white,
//                                 radius: 67,
//                                 child: Container(
//                                     height: 74,
//                                     width: 60,
//                                     child: Image.network(
//                                       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjzKgGevOlmVCQ_ROMb5GhVGn-8bCG2ncUNA&usqp=CAU",
//                                       fit: BoxFit.cover,
//                                     )),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.symmetric(vertical: 85,horizontal: 130),
//                           child: CircleAvatar(
//                               radius: 15,
//                               backgroundColor: Colors.black,
//                               child: Icon(Icons.edit,size: 20,color: Colors.white,)
//                           ),
//                         ),
//                       ],
//                     )
//                         : index != 4
//                         ? Row(
//                       children: [
//                         Container(
//                             height: 70,
//                             width: 30,
//                             decoration: const BoxDecoration(
//                               color: Colors.amber,
//                               borderRadius: BorderRadius.horizontal(
//                                   left: Radius.circular(3)),
//                             ),
//                             child: icons[index]),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Expanded(
//                           child: Stack(
//                             children: [
//                               Text(
//                                 datas[index].toUpperCase(),
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w400),
//                               ),
//                               index==2?TextField(
//                                 keyboardType: TextInputType.number,
//                               ):TextField(),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 300,vertical: 10),
//                                 child: Icon(Icons.edit),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     )
//                         : Container(
//                       height: 80,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 3, horizontal: 37),
//                             child: const Text(' GENDER:'),
//                           ),
//                           Row(
//                             children: [
//                               SizedBox(
//                                 width: 24,
//                               ),
//                               Container(
//                                 child: Radio<String>(
//                                   value: 'male',
//                                   groupValue: _selectedGender,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       _selectedGender = value!;
//                                     });
//                                   },
//                                 ),
//                               ),
//                               Text("MALE"),
//                               SizedBox(
//                                 width: 70,
//                               ),
//                               Container(
//                                 child: Radio<String>(
//                                   value: 'female',
//                                   groupValue: _selectedGender,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       _selectedGender = value!;
//                                     });
//                                   },
//                                 ),
//                               ),
//                               Text('FEMALE'),
//                             ],
//                           )
//                         ],
//                       ),
//                     );
//                   })),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.all(25),
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25),
//                         ))),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => CommunityList()),
//                   );
//                 },
//                 child: Padding(
//                   padding:
//                   const EdgeInsets.symmetric(vertical: 15, horizontal: 120),
//                   child: Text(
//                     "SAVE",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w400,
//                         fontSize: 19),
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
