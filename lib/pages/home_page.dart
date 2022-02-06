import 'package:flutter/material.dart';
import 'package:vision/models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel userModel = UserModel.getModel();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: Scaffold(body: Center(child: Text("Welcome ${userModel.firstName}, You are Logged In")),),
    );
  }
}