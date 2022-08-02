import 'package:community_internal/ui/screens/community_list.dart';
import 'package:community_internal/ui/screens/profile.dart';
import 'package:flutter/material.dart';

// import '../widgets/dummy_drawer.dart';

List<TextEditingController> _controller = [
  for (int i = 0; i < 5; i++) TextEditingController()
];
late String select;

class SameCom extends StatefulWidget {
  const SameCom({Key? key}) : super(key: key);

  @override
  State<SameCom> createState() => _SameComState();
}

class _SameComState extends State<SameCom> {
  List<Icon> icons = const [
    Icon(
      Icons.person,
      color: Colors.black,
    ),
    Icon(
      Icons.attach_email,
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
  ];
  List<String> datas = [
    "Doner's Name",
    "Doner's Email",
    "PHONE Number",
    "Address",
    "Amount Donated"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Same Community"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: icons.length,
                  itemBuilder: (context, index) {
                    //print("^^^^^^^^^^^ $index");
                    print(_controller.length);
                    return Row(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                            height: 70,
                            width: 30,
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(3)),
                            ),
                            child: icons[index]),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                datas[index].toUpperCase(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400),
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
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.maxFinite, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CommunityList()),
                  );
                },
                child: const Text(
                  "SAVE",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 19,
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
