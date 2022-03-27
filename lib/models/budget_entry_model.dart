class BudgetEntryModel {
  num? food;
  num? travel;
  num? shopping;
  num? entertainment;

  static final budgetEntryModel = BudgetEntryModel._internal();
  BudgetEntryModel._internal();

  BudgetEntryModel({this.food, this.travel, this.shopping, this.entertainment});

  // receiving data from server
  factory BudgetEntryModel.fromMap(map) {
    budgetEntryModel.food = map['food'];
    budgetEntryModel.travel = map['travel'];
    budgetEntryModel.shopping = map['shopping'];
    budgetEntryModel.entertainment = map['entertainment'];
    return budgetEntryModel;
  }

  factory BudgetEntryModel.getModel() => budgetEntryModel;

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'food': budgetEntryModel.food as num,
      'travel': budgetEntryModel.travel as num,
      'shopping': budgetEntryModel.shopping as num,
      'entertainment': budgetEntryModel.entertainment as num,
    };
  }
}
