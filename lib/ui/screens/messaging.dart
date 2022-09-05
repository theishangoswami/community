import 'package:community_internal/core/models/allchat.dart';
import 'package:community_internal/core/repository/ledger_repository.dart';
import 'package:community_internal/core/services/key_storage.service.dart';
import 'package:community_internal/ui/screens/inbox.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/material.dart';

class Messaging extends StatefulWidget {
  @override
  _MessagingState createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {
  List<AllChat>? _allChatList = [];
  bool _isLoading = false;
  final LedgerRepository _ledgerRepository = LedgerRepository();

  void fetchAllChatDetails() async {
    setState(() {
      _isLoading = true;
    });
    final user = StorageService().getCurrentUser()!;
    _allChatList = await _ledgerRepository.getAllChatDetails(user.id!);
    print(_allChatList);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAllChatDetails();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingHelper(
      isLoading: _isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Messaging",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.more_vert),
            )
          ],
        ),
        body: _allChatList?.isNotEmpty ?? false
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _allChatList!.length,
                itemBuilder: (context, index) {
                  final chat = _allChatList![index];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatBox(
                                recieverId: chat.id,
                                chatHeadName: chat.name ?? '',
                                profileImageurl: chat.profile ?? '',
                              ),
                            ),
                          ).whenComplete(() => fetchAllChatDetails());
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(
                              chat.profile?.isNotEmpty ?? false
                                  ? chat.profile!
                                  : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9HnW7_fXjyucPMl2rsiChfZC1M9fp5DL9QA&usqp=CAU",
                            ),
                            radius: 25,
                          ),
                          title: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Text(
                              chat.name ?? '',
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          // subtitle: Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: const [
                          //     Padding(
                          //       padding: EdgeInsets.all(3),
                          //       child: Text(
                          //         "Whats up",
                          //         style: TextStyle(fontSize: 16),
                          //       ),
                          //     ),
                          //     Padding(
                          //       padding: EdgeInsets.all(3.6),
                          //       child: Text(
                          //         "2:34 pm",
                          //         style: TextStyle(
                          //           fontWeight: FontWeight.bold,
                          //           color: Colors.grey,
                          //         ),
                          //       ),
                          //     )
                          //   ],
                          // ),
                          // trailing: const Text(
                          //   "Read ✔ ",
                          //   style: TextStyle(
                          //     fontWeight: FontWeight.bold,
                          //     color: Colors.green,
                          //   ),
                          // ),
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                    ],
                  );
                },
              )
            : const Center(child: Text('No chat to display')),
      ),
    );
  }
}
