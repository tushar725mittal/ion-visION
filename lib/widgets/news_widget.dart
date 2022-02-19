import 'package:flutter/material.dart';
import 'package:vision/models/newsapi.dart';

class NewsWidget extends StatelessWidget {
  final News? news_piece;
  const NewsWidget({Key? key, this.news_piece}) :  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      elevation: 50,
      child: ExpansionTile(
        title: Text(news_piece!.title!,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        textScaleFactor: 0.9,),
        subtitle: Text(news_piece!.date!),
        trailing: Icon(Icons.arrow_drop_down,),
        children: <Widget>[ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery. of(context).size.height -100, minHeight: 50),
          child: SingleChildScrollView(child: Container(padding: EdgeInsets.all(20),child: Text(news_piece!.content!),))
          ),          
        ],
      ),
    );
  }
}