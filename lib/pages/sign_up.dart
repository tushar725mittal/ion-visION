import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vision/models/user_model.dart';
import 'package:vision/utils/routes.dart';
import 'package:email_validator/email_validator.dart';

class SignupPage extends StatefulWidget {
  final e;

  const SignupPage({Key? key, this.e = ""}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var email = "";
  var password = "";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool changeButton = false;
  UserModel userModel = UserModel.getModel();
  final _formkey = GlobalKey<FormState>();

  signUP(BuildContext context) async {
    if(_formkey.currentState!.validate()){
    setState(() {
      email = emailController.text;
      password = passwordController.text;
      changeButton = true;
    });
    
    try {
       await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Account created successfully".text.make()));
       FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    
    User? user = _auth.currentUser;

    

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameController.text;
    userModel.secondName = secondNameController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
       await Future.delayed(Duration(milliseconds: 500));
        await context.vxNav.push(Uri.parse(MyRoutes.verifyRoute));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        print("Your email address appears to be malformed.");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Signing in with Email and Password is not enabled.".text.make()));
      } else if (e.code == 'operation-not-allowed') {
        print("Signing in with Email and Password is not enabled.");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Signing in with Email and Password is not enabled.".text.make()));
      } else if (e.code == 'too-many-requests') {
        print("Signing in with Email and Password is not enabled.");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Signing in with Email and Password is not enabled.".text.make()));
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
    passwordController.dispose();
    firstNameController.dispose();
    confirmPasswordController.dispose();
    secondNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    emailController.text = widget.e;
    return Scaffold(
      // color: context.canvasColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter your First Name",
                        prefixIcon: Icon(Icons.account_circle),
                        labelText: "First Name",
                      ),
                      controller: firstNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "First Name cannot be blank";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter your Last Name",
                        prefixIcon: Icon(Icons.account_circle),
                        labelText: "Last Name",
                      ),
                      controller: secondNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Last Name cannot be blank";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter your Email",
                        prefixIcon: Icon(CupertinoIcons.mail),
                        labelText: "Email",
                      ),
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty || !EmailValidator.validate(value)) {
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
                        } else if (value.contains(new RegExp(r'^(?=.*[a-z])$'))) {
                          return "Password Should Contain at least one lowercase letter";
                        }
                        else if (value.contains(new RegExp(r'^(?=.*[A-Z])$'))) {
                          return "Password Should Contain at least one uppercase letter";
                        }
                        else if (value.contains(new RegExp(r'^(?=.*?[!@#\$&*~])$'))) {
                          return "Password Should Contain at least special character";
                        }
                        else if (value.contains(new RegExp(r'^(?=.*?[0-9])$'))) {
                          return "Password Should Contain at least one number";
                        }
                        else if (value.length < 6) {
                          return "Length of password should be atleast 6";
                        }
                        return null;
                      },
                    ),
                     TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        prefixIcon: Icon(Icons.password),
                        labelText: "Confirm Password",
                      ),
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (passwordController.text != value){
                          return "Password does not match";
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
                        onTap: () => signUP(context),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          width: changeButton ? 50 : 120,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Sign UP",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
