import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class CustAppBar extends StatefulWidget with PreferredSizeWidget {
  final mode_name;

  const CustAppBar({Key? key, this.mode_name = Null}) : super(key: key);

  @override
  State<CustAppBar> createState() => _CustAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustAppBarState extends State<CustAppBar> {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Color(0xff005483),
        elevation: 10,
        shadowColor: Colors.black,
        leading: (widget.mode_name == Null)
            ? IconButton(
                icon: const Icon(CupertinoIcons.line_horizontal_3,
                    color: Color(0xff26A3DB)),
                onPressed: () => Scaffold.of(context).openDrawer(),
              )
            : IconButton(
                icon: Icon(Icons.arrow_back_ios_new, color: Color(0xff26A3DB)),
                onPressed: () {
                  if (widget.mode_name == " " || widget.mode_name == "INVEST") {
                    context.vxNav.pop();
                  } else {
                    context.vxNav.clearAndPush(Uri(path: '/home'));
                  }
                },
              ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        )),
        title: (widget.mode_name == Null)
            ? Image.asset(
                "assets/images/vision_logo.png",
                fit: BoxFit.cover,
              )
            : Column(
                children: [
                  Image.asset(
                    "assets/images/vision_logo.png",
                    fit: BoxFit.cover,
                  ),
                  Text(widget.mode_name,
                      style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold))
                ],
              ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_balance_wallet_outlined,
                color: Color(0xff26A3DB)),
            tooltip: 'Wallet',
            onPressed: () {
              setState(() {});
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Color(0xff26A3DB),
            ),
            tooltip: 'Notifications',
            onPressed: () {},
          ),
        ]);
  }
}
