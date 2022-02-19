import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';
import 'package:vision/models/bank_model.dart';
import 'package:vision/utils/routes.dart';

class BankPage extends StatelessWidget {
  BankPage({ Key? key }) : super(key: key);
  final bankModel = BankModel();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: bankModel.items.length,
        padding: EdgeInsets.fromLTRB(0, 50, 0, 15),
        itemBuilder: (context, index) => Card(
          elevation: 0,
          margin: EdgeInsets.fromLTRB(10, 5, 10, 15),
          color: Colors.brown[50],
          child: SizedBox(
            height: 100,
            child: Center(
              child: ListTile(
                leading: bankModel.items[index].icon.endsWith(".svg")? SvgPicture.network(bankModel.items[index].icon, width: 325,) : Image.network(bankModel.items[index].icon, width: 325),
                onTap: () async{
                  await context.vxNav.push(Uri.parse(MyRoutes.webRoute), params:{"url" : bankModel.items[index].weburl}); 
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}