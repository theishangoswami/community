import 'package:community_internal/core/models/chatbox.dart';
import 'package:community_internal/core/repository/ledger_repository.dart';
import 'package:community_internal/core/services/key_storage.service.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/material.dart';

class ChatBox extends StatefulWidget {
  final String recieverId;
  final String chatHeadName;
  final String profileImageurl;

  const ChatBox({
    Key? key,
    required this.recieverId,
    required this.chatHeadName,
    required this.profileImageurl,
  }) : super(key: key);
  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  bool _isLoading = false;
  List<ChatBoxModel>? _chatList = [];
  final LedgerRepository _ledgerRepository = LedgerRepository();
  final TextEditingController _messageController = TextEditingController();
  void sendMessage(String message) async {
    final user = StorageService().getCurrentUser()!;
    await _ledgerRepository.postChatDetails(
      {
        'from_id': user.id!,
        'to_id': widget.recieverId,
        'message': message,
      },
    );
    fetchMessages();
    _messageController.clear();
  }

  void fetchMessages() async {
    setState(() {
      _isLoading = true;
    });
    _chatList =
        await _ledgerRepository.getParticularChatDetails(widget.recieverId);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchMessages();
  }

  @override
  Widget build(BuildContext context) {
    final user = StorageService().getCurrentUser()!;
    return LoadingHelper(
      isLoading: _isLoading,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.amber,
          flexibleSpace: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      widget.chatHeadName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    backgroundImage: NetworkImage(
                      widget.profileImageurl.isNotEmpty
                          ? widget.profileImageurl
                          : "https://randomuser.me/api/portraits/men/5.jpg",
                    ),
                    maxRadius: 20,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          widget.chatHeadName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Online",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.more_vert,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: SizedBox(
                height: 900,
                width: 500,
                child: _chatList?.isNotEmpty ?? false
                    ? ListView.builder(
                        itemCount: _chatList!.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final message = _chatList![index];
                          return Container(
                            padding: const EdgeInsets.only(
                              left: 14,
                              right: 14,
                              top: 10,
                              bottom: 10,
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Align(
                                    alignment: message.receiverId == user.id!
                                        ? Alignment.topRight
                                        : Alignment.topLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: (message.receiverId == user.id!
                                            ? Colors.amber
                                            : Colors.grey.shade200),
                                      ),
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            message.message,
                                            style:
                                                const TextStyle(fontSize: 15),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4),
                                            child: Text(message.messageTime),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : const Center(child: Text('No message to show')),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        sendMessage(_messageController.text.trim());
                      },
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 18,
                      ),
                      backgroundColor: Colors.amber,
                      elevation: 0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
