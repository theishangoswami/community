import 'package:flutter/material.dart';

class MultiForm extends StatefulWidget {
  const MultiForm({Key? key}) : super(key: key);

  @override
  _MultiFormState createState() => _MultiFormState();
}

class _MultiFormState extends State<MultiForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REGISTER USERS'),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        // child: users.length <= 0
        //     ? const Center(
        //         child: ListTile(
        //           subtitle: Center(
        //             child: Text('Add form by tapping add button below'),
        //           ),
        //         ),
        //       )
        //     : ListView.builder(
        //         addAutomaticKeepAlives: true,
        //         itemCount: users.length,
        //         itemBuilder: (context, i) => users[i],
        //       ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddMember(),
            ),
          );
        },
        foregroundColor: Colors.white,
      ),
    );
  }
}

class AddMember extends StatefulWidget {
  const AddMember({Key? key}) : super(key: key);

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  final form = GlobalKey<FormState>();
  String dropdownvalue = 'Select Family Member';
  var items = ['Select Family Member', 'Son', 'Daughter', 'Wife', 'Husband'];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _adhaarCardNumberController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ADD MEMBER'),
          centerTitle: true,
        ),
        body: Form(
          key: form,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your name' : null,
                  decoration: const InputDecoration(
                    labelText: 'NAME',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                DropdownButtonFormField<String>(
                  value: dropdownvalue,
                  validator: (value) {
                    return value == 'Select Family Member'
                        ? 'Select a family member'
                        : null;
                  },
                  icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.keyboard_arrow_down),
                  ),
                  items: items.map((String items) {
                    return DropdownMenuItem<String>(
                      value: items,
                      child: Text(
                        items.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
                TextFormField(
                  controller: _mobileNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'PHONE NUMBER',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    } else if (value.length != 10) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _adhaarCardNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'AADHAR CARD NUMBER',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your aadhar card number';
                    } else if (value.length != 12) {
                      return 'Please enter a valid aadhar card number';
                    }
                    return null;
                  },
                ),
                const Spacer(),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.amber,
                    primary: Colors.black,
                    onSurface: Colors.grey,
                  ),
                  onPressed: () {
                    if (form.currentState!.validate()) {}
                  },
                  child: const Text('Add Member'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
