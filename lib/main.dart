import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vision/pages/bank_page.dart';
import 'package:vision/pages/broker_invest_options_page.dart';
import 'package:vision/pages/budget_entry.dart';
import 'package:vision/pages/invest_page.dart';
import 'package:vision/pages/budget_planner.dart';
import 'package:vision/pages/home_page.dart';
import 'package:vision/pages/login_page.dart';
import 'package:vision/pages/otp_verification.dart';
import 'package:vision/pages/password_reset.dart';
import 'package:vision/pages/sign_up.dart';
import 'package:vision/pages/verify_page.dart';
import 'package:vision/pages/web_page.dart';
import 'package:vision/utils/routes.dart';
import 'package:vision/widgets/themes.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        FlutterNativeSplash.remove();
        return MaterialApp.router(
          themeMode: ThemeMode.light,
          theme: MyTheme.lightTheme(context),
          darkTheme: MyTheme.darkTheme(context),
          debugShowCheckedModeBanner: false,
          routeInformationParser: VxInformationParser(),
          routerDelegate: VxNavigator(
            routes: {
              "/": (_, __) => MaterialPage(child: LoginPage()),
              MyRoutes.homeRoute: (_, __) => MaterialPage(child: HomePage()),
              MyRoutes.verifyRoute: (_, __) =>
                  MaterialPage(child: VerifyScreen()),
              MyRoutes.resetRoute: (_, __) => MaterialPage(child: ResetPage()),
              MyRoutes.investmentmodeRoute: (_, __) =>
                  MaterialPage(child: Invest_Page()),
              MyRoutes.budgetmodeRoute: (_, __) =>
                  MaterialPage(child: BudgetPlanner()),
              MyRoutes.bankpageRoute: (_, __) =>
                  MaterialPage(child: BankPage()),
              MyRoutes.budgetEntrypageRoute: (_, __) =>
                  MaterialPage(child: BudgetEntryPage()),
              MyRoutes.signupRoute: (_, params) => MaterialPage(
                      child: SignupPage(
                    e: params["email"],
                  )),
              MyRoutes.brokerinvestpageRoute: (_, params) => MaterialPage(
                      child: BrokerInvestOptionPage(
                    invest_option: params["investlist"],
                  )),
              MyRoutes.otpRoute: (_, params) => MaterialPage(
                      child: OtpPage(
                    e: params["email"],
                  )),
              MyRoutes.webRoute: (_, params) => MaterialPage(
                      child: WebViewClass(
                    url: params["url"],
                  )),
            },
          ),
        );
      },
    );
  }
}
