class BankModel {
  var items = [
    BankInfo(
        icon:
            "https://upload.wikimedia.org/wikipedia/en/5/58/State_Bank_of_India_logo.svg",
        weburl: "https://retail.onlinesbi.com/retail/login.htm"),
    BankInfo(
        icon: "https://www.icicibank.com/failover/images/logo.png",
        weburl: "https://www.icicibank.com/"),
    BankInfo(
        icon:
            "https://brandeps.com/logo-download/K/Kotak-Mahindra-Bank-logo-vector-01.svg",
        weburl: "https://netbanking.kotak.com/knb2/"),
  ];
}

class BankInfo {
  String icon;
  String weburl;
  BankInfo({
    required this.icon,
    required this.weburl,
  });
}
