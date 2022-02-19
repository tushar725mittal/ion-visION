import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:vision/models/newsapi.dart';
import 'package:vision/widgets/news_widget.dart';

class financial_news_Page extends StatefulWidget {
  @override
  State<financial_news_Page> createState() => _financial_news_PageState();
}

class _financial_news_PageState extends State<financial_news_Page> {
  String url = "https://eodhistoricaldata.com/api/news?api_token=OeAFFmMliFG5orCUuwAKQ8l4WWFQ67YX&s=AAPL.US&offset=0&limit=30";
  @override
  void initState() {
    super.initState();
    loadData();
  }
  
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch;
    Random random = new Random();
    int num = random.nextInt(60);
    url = "https://eodhistoricaldata.com/api/news?api_token=OeAFFmMliFG5orCUuwAKQ8l4WWFQ67YX&s=AAPL.US&offset=${num}&limit=${num+30}";
    await Future.delayed(Duration(milliseconds: 1000));
    loadData();
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    url = "https://eodhistoricaldata.com/api/news?api_token=OeAFFmMliFG5orCUuwAKQ8l4WWFQ67YX&s=AAPL.US&offset=50&limit=70";
    initState();
    if(mounted)
    setState(() {});
    _refreshController.loadComplete();
  }

  loadData() async {
    final response = await http.get(Uri.parse(url));
    final catalogJSON = response.body;
    final decodedData = jsonDecode(catalogJSON);
    NewsModel.new_piece = List.from(decodedData).map<News>((item) => News.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.pink,
        title: "Financial News".text.bold.white.xl.make(),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: WaterDropHeader(),
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
        child: NewsModel.new_piece != null && NewsModel.new_piece!.isNotEmpty? ListView.builder(
        itemCount: NewsModel.new_piece!.length,
        itemBuilder: (context,index) => Container(color: Colors.amber[50],child:NewsWidget(news_piece: NewsModel.new_piece![index],))      
      ):Center(
          child: CircularProgressIndicator(),
        ),
    )
      )
      );
  }
}

