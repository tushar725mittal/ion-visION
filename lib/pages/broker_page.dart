import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';
import 'package:vision/models/broker_model.dart';
import 'package:vision/utils/routes.dart';

class BrokerPage extends StatelessWidget {
  BrokerPage({ Key? key }) : super(key: key);
  final brokerModel = BrokerModel();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: brokerModel.items.length,
        padding: EdgeInsets.fromLTRB(0, 50, 0, 15),
        itemBuilder: (context, index) => Card(
          elevation: 0,
          margin: EdgeInsets.fromLTRB(10, 5, 10, 15),
          color: Colors.brown[50],
          child: SizedBox(
            height: 100,
            child: Center(
              child: ListTile(
                leading: brokerModel.items[index].icon.endsWith(".svg")? SvgPicture.network(brokerModel.items[index].icon, width: 325,) : Image.network(brokerModel.items[index].icon, width: 325),
                onTap: () async{
                  await context.vxNav.push(Uri.parse(MyRoutes.webRoute), params:{"url" : brokerModel.items[index].weburl}); 
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}