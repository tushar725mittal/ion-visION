import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vision/models/user_model.dart';
import 'package:vision/utils/routes.dart';
import 'package:email_validator/email_validator.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var email = "";
  var password = "";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool changeButton = false;
  UserModel userModel = UserModel.getModel();

  final _formkey = GlobalKey<FormState>();

  signIN(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        email = emailController.text;
        password = passwordController.text;
        changeButton = true;
      });

      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) => getDetails(context));
        await Future.delayed(Duration(milliseconds: 1000));
        final auth = FirebaseAuth.instance;
        User? user = auth.currentUser;
        if (user!.emailVerified) {
          await context.vxNav.push(Uri.parse(MyRoutes.otpRoute), params: {"email": emailController.text});
          // await context.vxNav.push(Uri.parse(MyRoutes.homeRoute));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: "Email not verified. Please verify email".text.make()));
              await context.vxNav.push(Uri.parse(MyRoutes.verifyRoute));

        }
      } on FirebaseAuthException catch (e) {
        changeButton = false;
        if (e.code == 'user-not-found') {
          print("This email is not registered");
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: "User not found. Sign-Up".text.make()));
          await context.vxNav.push(Uri.parse(MyRoutes.signupRoute),
              params: {"email": emailController.text});
        } else if (e.code == 'wrong-password') {
          print("Email and Password does not match");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: "Email and Password does not match".text.make()));
        }
      }
      FocusScopeNode currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      setState(() {
        changeButton = false;
      });
    }
  }

  getDetails(BuildContext context) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;

    firebaseFirestore
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        userModel.firstName = documentSnapshot.get("first name");
        userModel.secondName = documentSnapshot.get("second name");
      }
    });
    // writing all the values
    if(userModel.firstName == null || userModel.secondName == null){
      userModel.firstName = "Guest";
      userModel.secondName = "User";
    }
    userModel.email = user.email;
    userModel.uid = user.uid;
    return;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // color: context.canvasColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Image.asset(
                  "assets/images/signup_upper.png",
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter your Email",
                          prefixIcon: Icon(CupertinoIcons.mail),
                          labelText: "Email",
                        ),
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !EmailValidator.validate(value)) {
                            return "Enter valid Email-ID";
                          }
                          if (value.isEmpty) {
                            return "Email-ID cannot be empty";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          prefixIcon: Icon(Icons.password),
                          labelText: "Password",
                        ),
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value
                              .contains(new RegExp(r'^(?=.*[a-z])$'))) {
                            return "Password Should Contain at least one lowercase letter";
                          } else if (value
                              .contains(new RegExp(r'^(?=.*[A-Z])$'))) {
                            return "Password Should Contain at least one uppercase letter";
                          } else if (value
                              .contains(new RegExp(r'^(?=.*?[!@#\$&*~])$'))) {
                            return "Password Should Contain at least special character";
                          } else if (value
                              .contains(new RegExp(r'^(?=.*?[0-9])$'))) {
                            return "Password Should Contain at least one number";
                          } else if (value.length < 6) {
                            return "Length of password should be atleast 6";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Material(
                        color: context.theme.buttonColor,
                        borderRadius: changeButton
                            ? BorderRadius.circular(50)
                            : BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () => signIN(context),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 1000),
                            width: changeButton ? 50 : 120,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () => context.vxNav
                                  .push(Uri.parse(MyRoutes.resetRoute)),
                              child: Text('Forgot Password!'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an Account? "),
                            TextButton(
                              onPressed: () => context.vxNav.push(
                                  Uri.parse(MyRoutes.signupRoute),
                                  params: {"email": email}),
                              child: Text('Signup'),
                            ),
                          ],
                        ),
                      ),
                      Image(
                          image:
                              Image.asset("assets/images/vision_logo_white.png")
                                  .image),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Image.asset(
                  "assets/images/signup_lower.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
