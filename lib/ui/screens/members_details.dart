import 'package:community_internal/ui/screens/community_list.dart';
import 'package:flutter/material.dart';
int x = 0;
class MultiForm extends StatefulWidget {
  @override
  _MultiFormState createState() => _MultiFormState();
}

class _MultiFormState extends State<MultiForm> {
  List<UserForm> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
            onTap:() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CommunityList()),
              );
            },
            child: Text('REGISTER USERS')),
        actions: <Widget>[],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: users.length <= 0
            ? Center(
                child: ListTile(
                  subtitle: Center(
                      child: Text('Add form by tapping add button below')),
                ),
              )
            : ListView.builder(
                addAutomaticKeepAlives: true,
                itemCount: users.length,
                itemBuilder: (context, i) => users[i],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: onAddForm,
        foregroundColor: Colors.white,
      ),
    );
  }

  ///on add form
  void onAddForm() {
    setState(() {
      users.add(UserForm(
          // onDelete: () => onDelete(_user),
          ));
    });
  }
}

class UserForm extends StatefulWidget {
  final state = _UserFormState();
  @override
  _UserFormState createState() => state;
  //
  // bool isValid() => state.validate();
}

class _UserFormState extends State<UserForm> {
  final form = GlobalKey<FormState>();
  String dropdownvalue = 'Son';
  var items = [
'Son',
    'Daughter',
    'Wife',
    'Husband'
  ];

  @override
  Widget build(BuildContext context) {
    x = x + 1;
    return Padding(
      padding: EdgeInsets.all(16),
      child: Material(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                leading: Icon(Icons.verified_user),
                elevation: 0,
                title: Text('MEMBER $x'),
                backgroundColor: Theme.of(context).accentColor,
                centerTitle: true,
                actions: <Widget>[],
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'NAME',
                  ),
                ),
              ),
              Padding(
                 padding: EdgeInsets.only(left: 16, right: 16, top: 6),
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
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'PHONE NUMBER',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'AADHAR CARD NUMBER',
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

class User {
  String Name;
  String relation;
  String number;
  String aadhar;
  User(
      {this.Name = '', this.relation = '', this.number = '', this.aadhar = ''});
}
