import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vision/models/broker_invest_model.dart';
import 'package:vision/models/broker_model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vision/utils/routes.dart';
import 'package:vision/widgets/appBarWidget.dart';

class InvestmentMode extends StatefulWidget {
  const InvestmentMode({Key? key}) : super(key: key);

  @override
  _InvestmentModeState createState() => _InvestmentModeState();
}

class _InvestmentModeState extends State<InvestmentMode> {
  final brokerModel = BrokerModel();
  List<InvestInfo> invest_option = [];
  String? selectedBrokericon;
  @override
  Widget build(BuildContext context) {
    print("Size = ${MediaQuery.of(context).size.width}");
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xff26A3DB),
      appBar: CustAppBar(
        mode_name: "INVESTMENT MODE",
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
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      // color: Color(0x4F005484),
                      margin: EdgeInsets.zero,
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        color: Color(0xCC005484),
                        child: Card(
                            color: Color(0xCC26A3DB),
                            child: GestureDetector(
                              onTap: () => (invest_option.isNotEmpty)
                                  ? context.vxNav.push(
                                      Uri.parse(MyRoutes.brokerinvestpageRoute),
                                      params: {"investlist": invest_option})
                                  : null,
                              child: (selectedBrokericon == null)
                                  ? Text(
                                      "SELECT A BROKER",
                                      style: TextStyle(
                                          color: Color(0xccF3C349),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Lato"),
                                    ).centered()
                                  : selectedBrokericon!.endsWith(".svg")
                                      ? SvgPicture.network(
                                          selectedBrokericon!,
                                          width: MediaQuery.of(context).size.width/1.25,
                                        )
                                      : Image.network(selectedBrokericon!,
                                          width: MediaQuery.of(context).size.width/1.25),
                            )),
                      ),
                    ),
                  )),
            ),
            Container(
              // margin: EdgeInsets.zero,
              color: Colors.white,
              child: ListView.builder(
                itemCount: brokerModel.items.length,
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
                        leading: brokerModel.items[index].icon.endsWith(".svg")
                            ? SvgPicture.network(
                                brokerModel.items[index].icon,
                                width: MediaQuery.of(context).size.width/1.25,
                              )
                            : Image.network(brokerModel.items[index].icon,
                                width: MediaQuery.of(context).size.width/1.25),
                        onTap: () async {
                          await context.vxNav.push(Uri.parse(MyRoutes.webRoute),
                              params: {"url": brokerModel.items[index].weburl});
                          selectedBrokericon = brokerModel.items[index].icon;
                          invest_option = [];
                          if (brokerModel
                              .items[index].invest_options.isNotEmpty) {
                            for (var i = 0;
                                i <
                                    brokerModel
                                        .items[index].invest_options.length;
                                i++) {
                              invest_option.add(
                                  brokerModel.items[index].invest_options[i]);
                            }
                          }
                          if (this.mounted) {
                            setState(() {});
                          }
                        },
                        onLongPress: () async {
                          selectedBrokericon = brokerModel.items[index].icon;
                          invest_option = [];
                          if (brokerModel
                              .items[index].invest_options.isNotEmpty) {
                            for (var i = 0;
                                i <
                                    brokerModel
                                        .items[index].invest_options.length;
                                i++) {
                              invest_option.add(
                                  brokerModel.items[index].invest_options[i]);
                            }
                          }
                          if (this.mounted) {
                            setState(() {});
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ).expand()
          ],
        ),
      ),
    ));
  }
}
