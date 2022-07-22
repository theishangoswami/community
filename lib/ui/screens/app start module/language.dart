import 'package:community_internal/ui/onboarding/login_page.dart';
import 'package:flutter/material.dart';
List gender = ["Hindi","English"];
late String select;
class language extends StatefulWidget {
  const language({Key? key}) : super(key: key);

  @override
  State<language> createState() => _languageState();
}

class _languageState extends State<language> {
  String _selectedGender = 'English';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Choose language"),),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 600,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 17, horizontal: 90),
                child:  Column(
                  children: [
                    Text('Choose Language'.toUpperCase(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                    Text("________________________________________",style: TextStyle(fontWeight: FontWeight.w500,  decoration: TextDecoration.underline,)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90,vertical: 15),
                child: Text("Choose the language for your app :".toUpperCase(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.w200,color: Colors.grey),),
              ),
              Column(
                children: [
                  SizedBox(
                    width: 49,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 70),
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              child: Radio<String>(
                                value: 'English',
                                groupValue: _selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedGender = value!;
                                  });
                                },
                              ),
                            ),
                            Text("English",style: TextStyle(fontSize: 16),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 9),
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              child: Radio<String>(
                                value: 'Hindi',
                                groupValue: _selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedGender = value!;
                                  });
                                },
                              ),
                            ),
                            Text('Hindi',style: TextStyle(fontSize: 16),),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Align(alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(19),
                  child: RaisedButton(
                    color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Next",style:TextStyle(color:Colors.white)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
