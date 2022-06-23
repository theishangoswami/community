import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Icon> icon=[
    Icon(Icons.phone,color: Colors.black,),
    Icon(Icons.email,color: Colors.black,),
    Icon(Icons.add_road,color: Colors.black,),
    Icon(Icons.supervised_user_circle_rounded,color: Colors.black,),
  ];
  List<String> name=[
    "8677829011",
    "ShivamAgarwal@gmail.com",
    "Shalimar Garden , Sahibabad",
    "Male"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height:80,
            ),
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 45,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("S",style: TextStyle(color: Colors.white,fontSize: 30),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Shivam",style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height:40,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Center(
                  child: Container(
                    height: 562,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.white,
                          ]
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 582,
                  width: 440,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                        colors: [
                          Colors.grey.withOpacity(0.4),
                          Colors.white,
                        ]
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        height: 512,
                        width: 300,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.8),
                                Colors.white,
                              ]
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child:Column(
                          children: [
                            Container(
                              height:400,
                              child: ListView.builder(
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        ListTile(
                                          leading: icon[index],
                                          title: Text(name[index]),
                                          subtitle: Text("user details"),
                                          trailing: Icon(Icons.edit),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 17),
                                          child: Divider(
                                            thickness: 1.5,
                                          ),
                                        )
                                      ],
                                    );
                                  }),
                            ),
                            Container(
                              height: 50,
                              width: 200,
                              child: Center(child: Text("Edit Profile",style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white))),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.black
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

