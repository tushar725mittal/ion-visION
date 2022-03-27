import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:vision/pages/all_crypto.dart';
import 'package:vision/pages/crypto_wallet_page.dart';
import 'package:vision/pages/nft.dart';

class Crypto_Page extends StatefulWidget {
  @override
  State<Crypto_Page> createState() => _Crypto_PageState();
}

class _Crypto_PageState extends State<Crypto_Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: const Color(0xFFCBE6F2),
              appBar: AppBar(
                backgroundColor: const Color(0xff005483),
                elevation: 10,
                shadowColor: Colors.black,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new,
                      color: Color(0xff26A3DB)),
                  onPressed: () => context.vxNav.pop(),
                ),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                )),
                bottom: const TabBar(
                  tabs: [
                    Tab(text: ("Live Price")),
                    Tab(text: ("Wallets")),
                    Tab(text: ("NFTs")),
                  ],
                ),
                title: (Column(
                  children: [
                    Image.asset(
                      "assets/images/vision_logo.png",
                      fit: BoxFit.cover,
                    ),
                    Text("CRYPTO",
                        style: GoogleFonts.quicksand(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold))
                  ],
                )),
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
                ],
              ),
              body: TabBarView(
                children: [
                  Crypto(),
                  CrptoWalletPage(),
                  const NFTPage(),
                ],
              ),
            )));
  }
}
