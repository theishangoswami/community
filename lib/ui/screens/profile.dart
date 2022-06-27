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
    Icon(Icons.location_on_sharp,color: Colors.black,),
    Icon(Icons.cabin,color: Colors.black,),
  ];
  List<String> name=[
    "8677829011",
    "ShivamAgarwal@gmail.com",
    "Lg-1, gate no-9, Shalimar Garden",
    "Male",
    "Ghaziabad",
    "Shalimar Garden"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height:80,
            ),
            Row(
              children: [
                SizedBox(
                  width: 17,
                ),
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 45,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("S",style: TextStyle(color: Colors.black,fontSize: 30),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Shivam",style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                      Text("ANDROID DEVELOPER",style:TextStyle(fontSize: 10,fontWeight: FontWeight.w300),),
                      Text("LTD PRIVATE",style:TextStyle(fontSize: 5,fontWeight: FontWeight.w300),),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height:10,
            ),
            Flexible(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Center(
                    child: Container(
                      height: 1000,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                            colors: [
                              Colors.pinkAccent.withOpacity(0.6),
                              Colors.white,
                            ]
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 950,
                    width: 440,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(
                          colors: [
                            Colors.yellow.withOpacity(0.4),
                            Colors.amber,
                          ]
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              height: 950,
                              width: 300,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Colors.white,
                                    ]
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child:Column(
                                children: [
                                  Container(
                                    height:570,
                                    child: ListView.builder(
                                        itemCount: 6,
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
                                  // Container(
                                  //   height: 50,
                                  //   width: 200,
                                  //   child: Center(child: Text("Edit Profile",style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white))),
                                  //   decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(25),
                                  //       color: Colors.black
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black
                          ),
                      child: RaisedButton(
                        highlightElevation: 4,
                        elevation: 5,
                        color: Colors.white,
                          child: Text("Other details",style: TextStyle(color: Colors.black),),
                          onPressed: (){}
                      ),
                    ),
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

