import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vision/models/bank_model.dart';
import 'package:vision/utils/routes.dart';
import 'package:vision/widgets/appBarWidget.dart';

class BankPage extends StatelessWidget {
  BankPage({Key? key}) : super(key: key);
  final bankModel = BankModel();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFCBE6F2),
      child: Scaffold(
        appBar: CustAppBar(mode_name: "BANK"),
        body: ListView.builder(
          itemCount: bankModel.items.length,
          padding: EdgeInsets.fromLTRB(0, 50, 0, 15),
          itemBuilder: (context, index) => Card(
            elevation: 0,
            margin: EdgeInsets.fromLTRB(10, 5, 10, 15),
            color: ((index + 1) % 2 == 0 || (index + 1) % 3 == 0)
                ? (((index + 1) % 2 == 0)
                    ? Color(0xccED847E)
                    : Color(0xCC2E87A4))
                : Color(0xccF3C349),
            child: SizedBox(
              height: 100,
              child: Center(
                child: ListTile(
                    leading: bankModel.items[index].icon.endsWith(".svg")
                        ? SvgPicture.network(
                            bankModel.items[index].icon,
                            width: MediaQuery.of(context).size.width/1.25,
                          )
                        : Image.network(bankModel.items[index].icon,
                            width: MediaQuery.of(context).size.width/1.25),
                    onTap: () async {
                      await context.vxNav.push(Uri.parse(MyRoutes.webRoute),
                          params: {"url": bankModel.items[index].weburl});
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
