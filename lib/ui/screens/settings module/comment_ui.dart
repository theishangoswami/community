import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  List<String> user = ["awesome", "nice", "cool"];
  TextEditingController data = TextEditingController();
  var comment = "Awesome";
  void clearText() {
    data.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments".toUpperCase()),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.send))],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: 800,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    index == 0
                        ? const SizedBox(
                            height: 10,
                          )
                        : Container(),
                    ListTile(
                      leading: CircleAvatar(
                        child: Image.asset("assets/images/friend.png"),
                      ),
                      title: Row(
                        children: [
                          Text(
                            "Nihal".toUpperCase(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(user[index],
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 14)),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(3),
                      child: Divider(
                        color: Colors.black,
                      ),
                    )
                  ],
                );
              },
              itemCount: user.length,
            ),
          ),
          Container(
            height: 80,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 19),
              child: ListTile(
                leading: CircleAvatar(
                  child: Image.asset("assets/images/friend.png"),
                ),
                title: Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextField(
                    controller: data,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Comment as Nihal...'.toUpperCase()),
                  ),
                ),
                trailing: GestureDetector(
                    onTap: () {
                      setState(() {
                        comment = data.text;
                        user.add(comment);
                        clearText();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Post".toUpperCase(),
                        style: const TextStyle(fontSize: 15),
                      ),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
