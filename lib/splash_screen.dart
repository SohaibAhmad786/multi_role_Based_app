import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_role_based_app/admin.dart';
import 'package:multi_role_based_app/loginScreen.dart';
import 'package:multi_role_based_app/student.dart';
import 'package:multi_role_based_app/teacher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 3), () {
      checkLogin();
    });
    super.initState();
    
  }

  checkLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var type = sp.getString('type');
    if (type == "Student") {
      // ignore: use_build_context_synchronously
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const StudentView()));
    } else if (type == "Teacher") {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const TeacherView()));
    } else if (type == "Admin") {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AdminView()));
    } else if (type == null) {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        "images/study.jpg",
        height: double.infinity,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
