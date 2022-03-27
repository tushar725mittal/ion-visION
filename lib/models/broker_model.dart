import 'package:vision/models/broker_invest_model.dart';

class BrokerModel {
  var items = [
    BrokerInfo(
        icon:
            "https://cdn.kotakcherry.com/assets/images/cherry_logo_desktop.svg",
        weburl: "https://www.kotakcherry.com/welcome",
        invest_options: [
          InvestInfo(
              name: "Mutual Funds",
              weburl:
                  "https://www.kotakcherry.com/tour/mf?returnUrl=%2Fmutual-funds"),
          InvestInfo(
              name: "Deposits",
              weburl:
                  "https://www.kotakcherry.com/tour/deposits?returnUrl=%2Fdeposits%2Fdeposit-landing"),
          InvestInfo(
              name: "Futures & Options",
              weburl:
                  "https://www.kotakcherry.com/stocks/trade-future-options"),
          InvestInfo(
              name: "Stocks",
              weburl: "https://www.kotakcherry.com/stocks/stocks-landing"),
          InvestInfo(
              name: "IPO", weburl: "https://www.kotakcherry.com/stocks/ipo"),
          InvestInfo(
              name: "Cherry Basket",
              weburl: "https://www.kotakcherry.com/cherry-basket"),
          InvestInfo(name: "Gold", weburl: "https://www.kotakcherry.com/gold"),
          InvestInfo(
              name: "NPS",
              weburl:
                  "https://www.kotakcherry.com/nps/invest-in-national-pension-scheme"),
          InvestInfo(
              name: "Optimize Tax",
              weburl:
                  "https://www.kotakcherry.com/nps/invest-in-national-pension-scheme"),
          InvestInfo(
              name: "Futures & Options",
              weburl:
                  "https://www.kotakcherry.com/stocks/trade-future-options"),
          InvestInfo(
              name: "International Equity",
              weburl:
                  "https://www.kotakcherry.com/mutual-funds/offshore-landing"),
        ]),
    BrokerInfo(
        icon: "https://www.icicidirect.com/Content/images/Dotcom-logo.svg",
        weburl: "https://www.icicidirect.com/",
        invest_options: [
          InvestInfo(
              name: "Commodity",
              weburl: "https://www.icicidirect.com/commodities-market"),
          InvestInfo(
              name: "Forex",
              weburl: "https://www.icicidirect.com/currency-forex-trading"),
          InvestInfo(
              name: "Future and Options",
              weburl: "https://www.icicidirect.com/futures-and-options"),
          InvestInfo(
              name: "Equity", weburl: "https://www.icicidirect.com/equity"),
          InvestInfo(name: "IPO", weburl: "https://www.icicidirect.com/ipo"),
          InvestInfo(
              name: "Mutual Funds",
              weburl: "https://www.icicidirect.com/mutual-funds/moneyapp"),
          InvestInfo(
              name: "ETFs",
              weburl: "https://www.icicidirect.com/exchange-traded-funds-etf"),
          InvestInfo(
              name: "Currency",
              weburl: "https://www.icicidirect.com/currency-forex-trading"),
          InvestInfo(
              name: "Commodities",
              weburl: "https://www.icicidirect.com/commodities-market"),
          InvestInfo(
              name: "Insurances",
              weburl: "https://www.icicidirect.com/insurance-online"),
          InvestInfo(
              name: "Loans", weburl: "https://www.icicidirect.com/loans"),
          InvestInfo(
              name: "FDs and Bonds",
              weburl: "https://www.icicidirect.com/fd-and-bonds"),
          InvestInfo(
              name: "NPS",
              weburl: "https://www.icicidirect.com/national-pension-scheme"),
          InvestInfo(
              name: "Equity Research",
              weburl: "https://www.icicidirect.com/research/equity"),
          InvestInfo(
              name: "Private Wealth Management",
              weburl: "https://www.icicidirect.com/wealth"),
          InvestInfo(
              name: "Global Investment",
              weburl: "https://www.icicidirect.com/global-investment-services"),
        ]),
    BrokerInfo(
        icon:
            "https://upload.wikimedia.org/wikipedia/en/1/1d/Edelweiss_Group_logo.svg",
        weburl: "https://www.edelweiss.in/",
        invest_options: [
          InvestInfo(
              name: "Mutual Funds",
              weburl: "https://www.edelweiss.in/oyo/mutualfund"),
          InvestInfo(
              name: "Equity", weburl: "https://www.edelweiss.in/oyo/equity"),
          InvestInfo(
              name: "Guided Investment",
              weburl:
                  "https://smallcases.edelweiss.in/?26utm_source=edelweiss&utm_medium=website&utm_campaign=homepage&utm_content=guided-investing"),
          InvestInfo(
              name: "IPO,OFS,NCD & NFO",
              weburl: "https://www.edelweiss.in/new-issues"),
          InvestInfo(
              name: "Insurances",
              weburl: "https://www.edelweiss.in/app/generic-insurance"),
          InvestInfo(
              name: "Market Today", weburl: "https://www.edelweiss.in/market"),
          InvestInfo(
              name: "Market Movements",
              weburl:
                  "https://www.edelweiss.in/market/deep-dive-into-stock-markets"),
          InvestInfo(
              name: "Market Indices",
              weburl: "https://www.edelweiss.in/market/stock-market-index"),
          InvestInfo(
              name: "Market Map",
              weburl:
                  "https://www.edelweiss.in/market/deep-dive-into-stock-markets/share-market-map"),
          InvestInfo(
              name: "F&0 Trends",
              weburl:
                  "https://www.edelweiss.in/market/futures-and-options-trends"),
        ]),
  ];
}

class BrokerInfo {
  String icon;
  String weburl;
  List<InvestInfo> invest_options;
  BrokerInfo({
    required this.icon,
    required this.weburl,
    required this.invest_options,
  });
}
