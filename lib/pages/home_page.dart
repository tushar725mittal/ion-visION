import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vision/models/user_model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vision/utils/routes.dart';
import 'package:vision/widgets/appBarWidget.dart';
import 'package:vision/models/budget_entry_model.dart';
import 'package:vision/models/spending_model.dart';
import 'package:vision/utils/budgetDetail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    BudgetEntryModel budgetEntryModel = BudgetEntryModel.getModel();
    SpendingModel spendingModel = SpendingModel.getModel();
    getBudgetDetails(
        budgetEntryModel: budgetEntryModel, spendingModel: spendingModel);
    UserModel userModel = UserModel.getModel();
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xff26A3DB),
      appBar: CustAppBar(),
      drawer: Drawer(
        backgroundColor: Color(
          0xff005483,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
          right: Radius.circular(30),
        )),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Image(
                image: Image.asset(
              "assets/images/vision_logo.png",
              fit: BoxFit.cover,
            ).image),
            Divider(
              thickness: 3,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CircleAvatar(
                  backgroundImage: NetworkImage("https://i.pravatar.cc/140"),
                  minRadius: 40),
            ),
            Text(
              userModel.firstName! + " " + userModel.secondName!,
              style: GoogleFonts.quicksand(color: Colors.white, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 7, 0, 15.0),
              child: Text(
                userModel.email!,
                style: GoogleFonts.quicksand(color: Colors.white, fontSize: 20),
              ),
            ),
            Divider(
              thickness: 3,
              color: Colors.black,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "+ Link another account",
                  style:
                      GoogleFonts.quicksand(color: Colors.white, fontSize: 20),
                )),
            Divider(
              thickness: 3,
              color: Colors.black,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Switch accounts",
                  style:
                      GoogleFonts.quicksand(color: Colors.white, fontSize: 20),
                )),
            Divider(
              thickness: 3,
              color: Colors.black,
            ),
            TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  context.vxNav.clearAndPush(Uri(path: '/'));
                },
                child: Text(
                  "Log out",
                  style:
                      GoogleFonts.quicksand(color: Colors.white, fontSize: 20),
                )),
            Divider(
              thickness: 3,
              color: Colors.black,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Support",
                  style:
                      GoogleFonts.quicksand(color: Colors.white, fontSize: 20),
                )),
            Divider(
              thickness: 3,
              color: Colors.black,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Privacy Policy",
                  style:
                      GoogleFonts.quicksand(color: Colors.white, fontSize: 20),
                )),
            Divider(
              thickness: 3,
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30))),
              margin: EdgeInsets.zero,
              color: Color(0xff26A3DB),
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                        backgroundImage:
                            NetworkImage("https://i.pravatar.cc/140"),
                        minRadius: 70),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        userModel.firstName! + " " + userModel.secondName!,
                        style: GoogleFonts.quicksand(
                            color: Color(0xff005483),
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      userModel.email!,
                      style: GoogleFonts.quicksand(
                          color: Color(0xff005483), fontSize: 24),
                    )
                  ],
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        elevation: 20,
                        child: TextButton(
                            onPressed: () async => await context.vxNav
                                .push(Uri.parse(MyRoutes.bankpageRoute)),
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                backgroundColor: Color(0xCC005484),
                                padding: EdgeInsets.fromLTRB(50, 20, 50, 20)),
                            child: Text(
                              "Know your BANK",
                              style: GoogleFonts.quicksand(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Card(
                            elevation: 0,
                            child: GestureDetector(
                                onTap: () async => await context.vxNav
                                    .push(Uri.parse(MyRoutes.budgetmodeRoute)),
                                child: Image(
                                    image: Image.asset(
                                            "assets/images/budget_mode_logo.png")
                                        .image))),
                        Card(
                            elevation: 0,
                            child: GestureDetector(
                                onTap: () async => await context.vxNav.push(
                                    Uri.parse(MyRoutes.investmentmodeRoute)),
                                child: Image(
                                    image: Image.asset(
                                            "assets/images/investment_mode_logo.png")
                                        .image)))
                      ],
                    )
                  ],
                )).expand()
          ],
        ),
      ),
    ));
  }
}
