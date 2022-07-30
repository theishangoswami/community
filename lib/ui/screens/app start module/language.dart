import 'package:community_internal/ui/onboarding/login_page.dart';
import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String _selectedGender = 'English';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose language"),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 600,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 17, horizontal: 90),
                child: Column(
                  children: [
                    Text(
                      'Choose Language'.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    const Text("________________________________________",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        )),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                child: Text(
                  "Choose the language for your app :".toUpperCase(),
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w200,
                      color: Colors.grey),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    width: 49,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Radio<String>(
                              value: 'English',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value!;
                                });
                              },
                            ),
                            const Text(
                              "English",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 70, vertical: 9),
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Radio<String>(
                              value: 'Hindi',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value!;
                                });
                              },
                            ),
                            const Text(
                              'Hindi',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(19),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child:
                          Text("Next", style: TextStyle(color: Colors.white)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
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
