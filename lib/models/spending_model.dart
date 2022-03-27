class SpendingModel {
  num? food;
  num? travel;
  num? shopping;
  num? entertainment;

  static final spendingModel = SpendingModel._internal();
  SpendingModel._internal();

  SpendingModel({this.food, this.travel, this.shopping, this.entertainment});

  // receiving data from server
  factory SpendingModel.fromMap(map) {
    spendingModel.food = map['food'];
    spendingModel.travel = map['travel'];
    spendingModel.shopping = map['shopping'];
    spendingModel.entertainment = map['entertainment'];
    return spendingModel;
  }

  factory SpendingModel.getModel() => spendingModel;

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'food': spendingModel.food as num,
      'travel': spendingModel.travel as num,
      'shopping': spendingModel.shopping as num,
      'entertainment': spendingModel.entertainment as num,
    };
  }
}
