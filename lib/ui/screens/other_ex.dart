import 'package:community_internal/ui/screens/community_list.dart';
import 'package:community_internal/ui/screens/profile.dart';
import 'package:flutter/material.dart';

import '../widgets/dummy_drawer.dart';

List<TextEditingController> _controller = [
  for (int i = 0; i < 7; i++) TextEditingController()
];
late String select;

class OtherEx extends StatefulWidget {
  const OtherEx({Key? key}) : super(key: key);

  @override
  State<OtherEx> createState() => _OtherExState();
}

class _OtherExState extends State<OtherEx> {
  String dropdownvalue = 'First Community';
  var items = [
    'First Community',
    'Second',
    'Third',
    'Fourth'
  ];
  List<Icon> icons = const [
    Icon(
      Icons.person,
      color: Colors.black,
    ),
    Icon(
      Icons.person,
      color: Colors.black,
    ),
    Icon(
      Icons.phone_android,
      color: Colors.black,
    ),
    Icon(
      Icons.location_on_sharp,
      color: Colors.black,
    ),
    Icon(
      Icons.add,
      color: Colors.black,
    ),
    Icon(
      Icons.receipt,
      color: Colors.black,
    ),
    Icon(
      Icons.description,
      color: Colors.black,
    ),
  ];
  List<String> datas = [
    "",
    "Vendor Name",
    "Vendor pHONE Number",
    "Vendor Address",
    "Expense Amount",
    "Upload Receipt",
    "Description"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Other Community"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return index==0?  Padding(
                      padding: EdgeInsets.symmetric(vertical: 6,horizontal: 4.6),
                      child: Container(
                        height: 80,
                        width: 330,
                        child: DropdownButton(
                          value: dropdownvalue,
                          icon: Align(
                              alignment: Alignment.centerRight,
                              child: const Icon(Icons.keyboard_arrow_down)),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Row(
                                children: [
                                  Text(items,style: TextStyle(fontSize: 20),),
                                  SizedBox(
                                    width: 220,
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                    ):
                    Row(
                      children: [
                        Container(
                            height: 70,
                            width: 30,
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(3)),
                            ),
                            child: icons[index]),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                datas[index].toUpperCase(),
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                              TextField(
                                controller: _controller[index],
                                keyboardType: index == 2
                                    ? TextInputType.number
                                    : TextInputType.text,
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  })),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CommunityList()),
                  );
                },
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 120),
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 19),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
