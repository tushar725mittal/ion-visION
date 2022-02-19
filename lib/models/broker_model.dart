class BrokerModel{
  var items = [
    BrokerInfo(
      icon: "https://cdn.kotakcherry.com/assets/images/cherry_logo_desktop.svg",
      weburl: "https://www.kotakcherry.com/welcome"
    ),
    BrokerInfo(
      icon: "https://www.icicidirect.com/Content/images/Dotcom-logo.svg",
      weburl: "https://www.icicidirect.com/"
    ),
    BrokerInfo(
      icon: "https://upload.wikimedia.org/wikipedia/en/1/1d/Edelweiss_Group_logo.svg",
      weburl: "https://www.edelweiss.in/"
    ),
  ];
}

class BrokerInfo {
  String icon;
  String weburl;
  BrokerInfo({
    required this.icon,
    required this.weburl,
  });
}
