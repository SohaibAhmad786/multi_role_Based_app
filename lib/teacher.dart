import 'package:flutter/material.dart';
import 'package:multi_role_based_app/loginScreen.dart';
import 'package:multi_role_based_app/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherView extends StatefulWidget {
  const TeacherView({super.key});

  @override
  State<TeacherView> createState() => _TeacherViewState();
}
var email='';
var type='';

class _TeacherViewState extends State<TeacherView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        loaddata();

  }

    loaddata() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email')!;
    type = sp.getString('type')!;
        setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teacher View",style: TextStyle(fontSize: 22),),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Email",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                email,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Type",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                type,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: TextButton(
                onPressed: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.clear();
                  // ignore: use_build_context_synchronously
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
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