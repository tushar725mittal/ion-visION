import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vision/utils/routes.dart';
import 'package:email_validator/email_validator.dart';

class ResetPage extends StatefulWidget {
  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  var email = "";
  final emailController = TextEditingController();
  bool changeButton = false;

  final _formkey = GlobalKey<FormState>();

  signIN(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        email = emailController.text;
        changeButton = true;
      });

      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: "Password Reset Mail Sent to ${email}".text.make()));
        context.vxNav.pop();
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
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
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
                          labelText: "Registered Email",
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
                      SizedBox(
                        height: 80.0,
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
                                    "Send Reset Link",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                          ),
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
