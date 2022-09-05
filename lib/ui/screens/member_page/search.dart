import 'package:community_internal/core/models/user_model.dart';
import 'package:community_internal/core/repository/users.repository.dart';
import 'package:community_internal/ui/screens/members.list.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool? _isLoading;
  final UserRepository _userRepository = UserRepository();
  List<UserModel>? _userList = [];

  void searchUser(String searchQuery) async {
    await Future.delayed(const Duration(milliseconds: 500), () async {
      setState(() {
        _isLoading = true;
      });
      if (searchQuery.isNotEmpty) {
        _userList = await _userRepository.getSearchedUser(searchQuery);
      }
      setState(() {
        _isLoading = false;
      });
    });
    if (searchQuery.isEmpty) {
      setState(() {
        _isLoading = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.amber,
          ),
          child: TextField(
            onChanged: (value) {
              searchUser(value);
            },
            decoration: InputDecoration(
              hintText: "Search people".toUpperCase(),
              hintStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
        ),
      ),
      body: _isLoading == null
          ? const Center(child: Text("Your searches appear here"))
          : _isLoading!
              ? const Center(child: CircularProgressIndicator())
              : MembersGridList(
                  userList: _userList ?? [],
                ),
    );
  }
}
