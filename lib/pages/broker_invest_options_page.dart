import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:vision/models/broker_invest_model.dart';
import 'package:vision/utils/routes.dart';
import 'package:vision/widgets/appBarWidget.dart';

class BrokerInvestOptionPage extends StatelessWidget {
  BrokerInvestOptionPage({
    Key? key,
    required this.invest_option,
  }) : super(key: key);
  final List<InvestInfo> invest_option;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFCBE6F2),
      child: Scaffold(
        backgroundColor: Color(0xFFCBE6F2),
        appBar: CustAppBar(mode_name: "INVEST"),
        body: ListView.builder(
          itemCount: invest_option.length,
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
                    leading: Text(
                      invest_option[index].name,
                      style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFFCBE6F2),
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () async {
                      await context.vxNav.push(Uri.parse(MyRoutes.webRoute),
                          params: {"url": invest_option[index].weburl});
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
