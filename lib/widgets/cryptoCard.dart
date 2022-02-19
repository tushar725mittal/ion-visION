import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vision/models/crytpo_model.dart';

class CryptoDetails extends StatelessWidget {
  final Currency? currency;
  const CryptoDetails({ Key? key, @required this.currency }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [ListTile(
          horizontalTitleGap: 10,
          contentPadding: EdgeInsets.only(right: 15),
          // isThreeLine: true,
          // visualDensity: VisualDensity.compact,
          tileColor: Colors.white,
          onTap: () {},
          title: (double.parse(currency!.changePercentage!) >= 0)? Row(children: [SizedBox(width: 100,child: Text(currency!.name!, softWrap: true,)), Icon(Icons.arrow_upward_rounded, color: Colors.green[600])]) : Row(children: [SizedBox(width: 100,child: Text(currency!.name!, softWrap: true,)), Icon(Icons.arrow_downward_rounded, color: Colors.red[600])]),
          subtitle: Text(currency!.symbol!),
          leading: SizedBox(height: 60, width: 60, child: currency!.imageUrl!.endsWith(".svg")? CircleAvatar(backgroundColor: Colors.brown[50],child: Padding(padding: EdgeInsets.all(3), child:SvgPicture.network(currency!.imageUrl!))) : CircleAvatar(backgroundColor: Colors.brown[50],child: Padding(padding: EdgeInsets.all(3), child:Image.network(currency!.imageUrl!)))),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: (double.parse(currency!.changePercentage!) >= 0)? [(currency!.price!).text.green600.xl.bold.make(), Container(width: 70,height: 25,padding: EdgeInsets.all(2),alignment: Alignment.center,decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),color: Colors.green[600]), child: Text(currency!.changePercentage! + "%", textScaleFactor: 1, style: TextStyle(color: Colors.white)))] : [(currency!.price!).text.red600.xl.bold.make(), Container(width: 70,height: 25,padding: EdgeInsets.all(2),alignment: Alignment.center,decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),color: Colors.red[600]), child: Text(currency!.changePercentage! + "%", textScaleFactor: 1, style: TextStyle(color: Colors.white)))],
          ),
        ),
        Divider(thickness: 2)
        ],
      ),
    );
  }
}