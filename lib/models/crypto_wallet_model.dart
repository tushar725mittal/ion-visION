class CrptoWalletModel{
  var items = [
    CrptoWalletInfo(
      icon: "https://www.svgrepo.com/show/331638/wazirx.svg",
      weburl: "https://wazirx.com/login"
    ),
    CrptoWalletInfo(
      icon: "https://uphold.com/en/developer/api/documentation/images/logo.png",
      weburl: "https://wallet.uphold.com/dashboard"
    ),
    CrptoWalletInfo(
      icon: "https://images.ctfassets.net/q5ulk4bp65r7/3TBS4oVkD1ghowTqVQJlqj/2dfd4ea3b623a7c0d8deb2ff445dee9e/Consumer_Wordmark.svg",
      weburl: "https://www.coinbase.com/signin"
    ),
  ];
}

class CrptoWalletInfo {
  String icon;
  String weburl;
  CrptoWalletInfo({
    required this.icon,
    required this.weburl,
  });
}
