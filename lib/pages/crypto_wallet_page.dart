import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vision/models/crypto_wallet_model.dart';
import 'package:vision/utils/routes.dart';

class CrptoWalletPage extends StatelessWidget {
  CrptoWalletPage({Key? key}) : super(key: key);
  final crptoWalletModel = CrptoWalletModel();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFCBE6F2),
      child: ListView.builder(
        itemCount: crptoWalletModel.items.length,
        padding: EdgeInsets.fromLTRB(0, 50, 0, 15),
        itemBuilder: (context, index) => Card(
          elevation: 0,
          margin: EdgeInsets.fromLTRB(10, 5, 10, 15),
          color: ((index + 1) % 2 == 0 || (index + 1) % 3 == 0)
              ? (((index + 1) % 2 == 0) ? Color(0xccED847E) : Color(0xCC2E87A4))
              : Color(0xccF3C349),
          child: SizedBox(
            height: 100,
            child: Center(
              child: ListTile(
                  leading: crptoWalletModel.items[index].icon.endsWith(".svg")
                      ? SvgPicture.network(
                          crptoWalletModel.items[index].icon,
                          width: MediaQuery.of(context).size.width/1.25,
                        )
                      : Image.network(crptoWalletModel.items[index].icon,
                          width: MediaQuery.of(context).size.width/1.25),
                  onTap: () async {
                    await context.vxNav.push(Uri.parse(MyRoutes.webRoute),
                        params: {"url": crptoWalletModel.items[index].weburl});
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
