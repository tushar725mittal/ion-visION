import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vision/utils/routes.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  User? user;
  Timer? timer;

  @override
  void initState() {
    user = auth.currentUser;
    if (user!.emailVerified) {
      print("verified");
    } else {
      user!.sendEmailVerification();
    }

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/vision_background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Text(
              'Verification email sent to ${user!.email}. Plase verify to continue'),
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user!.reload();
    // print(user!.emailVerified);
    if (user!.emailVerified) {
      timer!.cancel();
      await context.vxNav.clearAndPush(Uri.parse(MyRoutes.homeRoute));
    }
  }
}
