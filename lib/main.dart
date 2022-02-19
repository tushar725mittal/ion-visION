import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vision/models/broker_model.dart';
import 'package:vision/pages/all_crypto.dart';
import 'package:vision/pages/broker_page.dart';
import 'package:vision/pages/crypto_wallet_page.dart';
import 'package:vision/pages/financial_news_page.dart';
import 'package:vision/pages/home_page.dart';
import 'package:vision/pages/login_page.dart';
import 'package:vision/pages/otp_verification.dart';
import 'package:vision/pages/password_reset.dart';
import 'package:vision/pages/sign_up.dart';
import 'package:vision/pages/verify_page.dart';
import 'package:vision/pages/web_page.dart';
import 'package:vision/utils/routes.dart';
import 'package:vision/widgets/news_widget.dart';
import 'package:vision/widgets/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
        future: _initialization,
        builder: (context,snapshot){
          if(snapshot.hasError){
            print("Something went wrong");
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(routes: {
        "/": (_,__) => MaterialPage(child: Crypto()),
        MyRoutes.homeRoute: (_,__) => MaterialPage(child: HomePage()),
        MyRoutes.verifyRoute: (_,__) => MaterialPage(child: VerifyScreen()),
        MyRoutes.resetRoute: (_,__) => MaterialPage(child: ResetPage()),
        MyRoutes.signupRoute: (_,params) => MaterialPage(child: SignupPage(e: params["email"],)),
        MyRoutes.otpRoute: (_,params) => MaterialPage(child: OtpPage(e: params["email"],)),
        MyRoutes.webRoute: (_,params) => MaterialPage(child: WebViewClass(url: params["url"],)),
      },),
    );
        },
      );

         
  }
}
