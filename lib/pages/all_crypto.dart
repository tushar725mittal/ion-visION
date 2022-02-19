import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vision/models/crytpo_model.dart';
import 'package:vision/widgets/cryptoCard.dart';


class Crypto extends StatefulWidget {
  var editingController = TextEditingController();
  Crypto({Key? key}) : super(key: key);

  @override
  _CryptoState createState() => _CryptoState();
}

class _CryptoState extends State<Crypto> {
  String realCurr = "INR";
  String interval = "1d";
    List<Currency> passedList = [];
  Future<void> getCurrency() async {
    List<Currency> newCurrList = [];
    final response = await http.get(Uri.parse(
        'https://api.nomics.com/v1/currencies/ticker?key=d2f6b16e41f1c0325e6406751f18b7f7a83d44cd&interval=${interval}&convert=${realCurr}&per-page=100&page=1'));

    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            newCurrList.add(Currency.fromJson(map, interval));
          }
        }
        if(this.mounted){
            setState(() {});
        }
      }
      currList = newCurrList;
      passedList = currList;
    } 
  }

  @override
  void initState() {
    getCurrency();
    Timer.periodic(Duration(seconds: 10), (timer) => getCurrency());
    super.initState();
  }

 @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          title: const Text(
            'Crypto Space',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: (passedList == null)? CircularProgressIndicator():Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                  Container(
                    color: Colors.lime[50],
                    width: 200,
                    child: TextField(
                    onChanged: (value) {      
                          passedList = currList.where((element) => element.name!.startsWith(value)).toList();
                          if(this.mounted){
                              setState(() {});
                          }                              
                    },
                    controller: widget.editingController,
                    decoration: InputDecoration(
                        labelText: "Search",
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                ),
                  ),
                  Container(
                    width: 80,
                    child: Card(
                      elevation: 50,
                      child: PopupMenuButton<String>(
                                  icon: Row(children: [Text(realCurr), Icon(Icons.arrow_drop_down)]),
                                  onSelected: (item) {
                                    realCurr = item;
                                    getCurrency();
                                    if(this.mounted){
                                      setState(() {
                                      });
                                    }
                                  },
                                  itemBuilder: (context) => [
                                    PopupMenuItem<String>(child: Text("INR"), value: "INR"),
                                    PopupMenuItem<String>(child: Text("USD"), value: "USD"),
                                    PopupMenuItem<String>(child: Text("EUR"), value: "EUR"),
                                  ]),
                    ),
                  ),
                  Container(
                    width: 80,
                    child: Card(
                      elevation: 50,
                      child: PopupMenuButton<String>(
                                  icon: Row(children: [Text(interval), Icon(Icons.arrow_drop_down)]),
                                  onSelected: (item) {
                                    interval = item;
                                    getCurrency();
                                    if(this.mounted){
                                      setState(() {
                                      });
                                    }
                                  },
                                  itemBuilder: (context) => [
                                    PopupMenuItem<String>(child: Text("1d"), value: "1d"),
                                    PopupMenuItem<String>(child: Text("7d"), value: "7d"),
                                    PopupMenuItem<String>(child: Text("30d"), value: "30d"),
                                    PopupMenuItem<String>(child: Text("365d"), value: "365d"),
                                    PopupMenuItem<String>(child: Text("ytd"), value: "ytd"),
                                  ]),
                    ),
                  )
                ]
              ),
            ),
            Expanded(
              child: ListView.builder(
          itemCount: passedList.length,
          itemBuilder: (context, index) {
            return CryptoDetails(
              currency: passedList[index]
            );
          },
        )
            ),
          ],
        ),
      ),
        );
  }
}

