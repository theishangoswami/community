import 'package:community_internal/core/models/memberdetails.dart';
import 'package:community_internal/core/repository/ledger_repository.dart';
import 'package:community_internal/core/services/key_storage.service.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/material.dart';

class MultiForm extends StatefulWidget {
  const MultiForm({Key? key}) : super(key: key);

  @override
  _MultiFormState createState() => _MultiFormState();
}

class _MultiFormState extends State<MultiForm> {
  List<MemberDetails>? _memberDetailList = [];
  bool _isLoading = false;
  void fetchMemberDetails() async {
    setState(() {
      _isLoading = true;
    });
    final user = StorageService().getCurrentUser()!;
    _memberDetailList = await LedgerRepository().getMemberDetails(user.id!);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchMemberDetails();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingHelper(
      isLoading: _isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('FAMILY DETAILS'),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: _memberDetailList?.isEmpty ?? true
              ? const Center(
                  child: ListTile(
                    subtitle: Center(
                      child: Text('Add form by tapping add button below'),
                    ),
                  ),
                )
              : ListView.builder(
                  addAutomaticKeepAlives: true,
                  itemCount: _memberDetailList!.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                        'User Relation - ${_memberDetailList![index].userRelation}'),
                    subtitle: Text(
                      'Relation Name - ${_memberDetailList![index].name}\nMobile Number - ${_memberDetailList![index].mobileNumber}\nAdhaar Number - ${_memberDetailList![index].adhaarNumber}',
                    ),
                    isThreeLine: true,
                  ),
                ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            final res = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddMember(),
              ),
            );
            if (res) {
              fetchMemberDetails();
            }
          },
          foregroundColor: Colors.white,
        ),
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
  var items = ['Select Family Member', 'Mother', 'Father', 'Brother', 'Sister'];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _adhaarCardNumberController =
      TextEditingController();
  final LedgerRepository _ledgerRepository = LedgerRepository();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: LoadingHelper(
        isLoading: _isLoading,
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
                    onPressed: () async {
                      if (form.currentState!.validate()) {
                        setState(() {
                          _isLoading = true;
                        });
                        final user = StorageService().getCurrentUser();
                        final res = await _ledgerRepository.addMember(
                          {
                            'user_id': user!.id!,
                            'name': _nameController.text.trim(),
                            'user_relation': dropdownvalue.trim(),
                            'mobile_number':
                                _mobileNumberController.text.trim(),
                            'adhar_number':
                                _adhaarCardNumberController.text.trim(),
                          },
                        );
                        setState(() {
                          _isLoading = false;
                        });
                        if (res) {
                          Navigator.pop(context, true);
                        }
                      }
                    },
                    child: const Text('Add Member'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
