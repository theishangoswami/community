import 'package:community_internal/ui/screens/member_profile.dart';
import 'package:community_internal/ui/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

class Posting extends StatefulWidget {
  const Posting({Key? key}) : super(key: key);

  @override
  State<Posting> createState() => _PostingState();
}

class _PostingState extends State<Posting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text(
        "LEDGER BALANCE".toUpperCase(),
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
        ],),
      body: ListView(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 24),
                      child: Text("MEMBER",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 19,decoration: TextDecoration.underline,),),
                    ),
                    SizedBox(
                      width: 153,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 15),
                      child: Text("AMOUNT",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 19,decoration: TextDecoration.underline,),),
                    ),
                  ],
                ),
                SizedBox(
                  height: 23,
                ),
                Container(
                  height: 700,
                  child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context,index){
                        return index==0?Column(
                            children:[
                              Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  CircleAvatar(
                                      radius: 25, child: Image.asset("assets/images/break.png")
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Text("Rahul",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18)),
                                  ),
                                  SizedBox(
                                    width: 192,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    child: Text("₹ 54",style: TextStyle(fontSize: 17,color:Colors.green),),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Divider(
                                  color: Colors.black,
                                ),
                              ),
                            ]
                        ):Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  radius: 25,
                                  child: Image.asset("assets/images/break.png")
                              ),
                              title:Text("Nihal",style: TextStyle(fontSize: 19),) ,
                              trailing: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("₹ 754",style: TextStyle(fontSize: 17,color:Colors.green),),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        );
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
