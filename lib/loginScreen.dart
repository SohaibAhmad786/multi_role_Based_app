import 'package:flutter/material.dart';
import 'package:multi_role_based_app/student.dart';
import 'package:multi_role_based_app/teacher.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

String initialvalue = 'Teacher';
var type = ['Teacher', 'Student', 'Admin'];
TextEditingController emailctrl = TextEditingController();
TextEditingController typectrl = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign Up",
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailctrl,
              decoration: const InputDecoration(hintText: "Email"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton(
                dropdownColor: Colors.blueGrey,
                value: initialvalue,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  size: 25,
                ),
                items: type.map((String type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(
                      type,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newvalue) {
                  initialvalue = newvalue.toString();
                  typectrl.text = newvalue.toString();
                  setState(() {});
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () async {
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    sp.setString('email', emailctrl.text.toString());
                    sp.setString('type', typectrl.text.toString());
                    if (sp.getString('type') == "Student") {
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StudentView()));
                    } else if (sp.getString('type') == "Teacher") {
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TeacherView()));
                    } else if (sp.getString('type') == "Admin") {
                      // ignore: use_build_context_synchronously
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const AdminView()));
                    }
                    setState(() {});
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
