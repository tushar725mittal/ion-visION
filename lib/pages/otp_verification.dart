import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vision/utils/routes.dart';

class OtpPage extends StatefulWidget {
  final e;

  const OtpPage({Key? key, this.e}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  var otp = "";
  final otpController = TextEditingController();
  bool changeButton = false;
  EmailAuth? emailAuth;
  final _formkey = GlobalKey<FormState>();

  verifyOTP(BuildContext context) async {
    if(_formkey.currentState!.validate()){
    setState(() {
      otp = otpController.text;
      changeButton = true;
    });
    await Future.delayed(Duration(milliseconds: 500));
    var res = await emailAuth!.validateOtp(recipientMail: widget.e, userOtp: otp);
    if(res){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "OTP Verified".text.make()));
      await context.vxNav.clearAndPush(Uri.parse(MyRoutes.homeRoute));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Enter Correct OTP".text.make()));
    }
  
    }
    setState(() {
      changeButton = false;
    });
    }

   send() async{
    var res = await emailAuth!.sendOtp(recipientMail: widget.e);
    if(res){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "OTP Sent".text.make()));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Failed to send OTP".text.make()));
    }
  }

  @override
  void initState() {
    super.initState();
    // Initialize the package
    emailAuth = new EmailAuth(
      sessionName: "visION4859",
    );
    send();
  }
  
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    otpController.dispose();
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
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter OTP",
                        prefixIcon: Icon(Icons.password),
                        labelText: "OTP",
                        suffix: TextButton(
                      onPressed: () => send(),
                      child: Text('Send OTP'),
                    ),
                      ),
                      controller: otpController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter OTP";
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
                        onTap: () => verifyOTP(context),
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
                                  "Verify OTP",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                        ),
                      ),
                    ),
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