import 'package:community_internal/ui/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

import '../member_profile.dart';

class Request extends StatefulWidget {
  const Request({Key? key}) : super(key: key);

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text(
        "transaction request".toUpperCase(),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 293,
                child: Card(
                  elevation: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                            child: CircleAvatar(
                              child: Image.asset("assets/images/break.png"),
                              radius: 23,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Rahul",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          Text("Fri ,5 Aug",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16))
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Expenses".toUpperCase(),style: TextStyle(fontWeight: FontWeight.w600,color: Colors.orange),),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: Text(" Decription".toUpperCase(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14)),
                                ),
                                Text(" Decription given by the user",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15)),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 56,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 6),
                                  child: Text("Amount".toUpperCase(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14)),
                                ),
                                Text(" 700",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                        child: Container(
                          width: 400,
                          child: Card(
                              elevation: 4,
                              child:Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: [
                                        Icon(Icons.upload),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text("Download Receipt",style: TextStyle(fontSize:18,fontWeight: FontWeight.w400),),
                                      ],
                                    )),
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 23),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 40,
                              width: 140,
                              child: RaisedButton(
                                  color:Colors.green,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Text("Accept",style:TextStyle(color:Colors.white,fontSize: 19)),
                                  ),
                                  onPressed: () {
                                  }
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            SizedBox(
                              height: 40,
                              width: 140,
                              child: RaisedButton(
                                  color:Colors.red,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Text("Decline",style:TextStyle(color:Colors.white,fontSize: 19)),
                                  ),
                                  onPressed: () {
                                  }
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 210,
                child: Card(
                  elevation: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                            child: CircleAvatar(
                              child: Image.asset("assets/images/break.png"),
                              radius: 23,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Rahul",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          Text("Fri ,5 Aug",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16))
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Donation".toUpperCase(),style: TextStyle(fontWeight: FontWeight.w600,color: Colors.orange),),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: Text(" Decription".toUpperCase(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14)),
                                ),
                                Text(" Decription given by the user",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15)),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 56,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 6),
                                  child: Text("Amount".toUpperCase(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14)),
                                ),
                                Text(" 700",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 23),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 40,
                              width: 140,
                              child: RaisedButton(
                                  color:Colors.green,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Text("Accept",style:TextStyle(color:Colors.white,fontSize: 19)),
                                  ),
                                  onPressed: () {
                                  }
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            SizedBox(
                              height: 40,
                              width: 140,
                              child: RaisedButton(
                                  color:Colors.red,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Text("Decline",style:TextStyle(color:Colors.white,fontSize: 19)),
                                  ),
                                  onPressed: () {
                                  }
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
