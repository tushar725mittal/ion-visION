import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vision/models/budget_entry_model.dart';
import 'package:vision/models/spending_model.dart';
import 'package:vision/utils/budgetDetail.dart';
import 'package:vision/utils/routes.dart';
import 'package:vision/widgets/appBarWidget.dart';
import 'package:dotted_line/dotted_line.dart';

class BudgetPlanner extends StatefulWidget {
  const BudgetPlanner({Key? key}) : super(key: key);

  @override
  _BudgetPlannerState createState() => _BudgetPlannerState();
}

class _BudgetPlannerState extends State<BudgetPlanner> {
  @override
  Widget build(BuildContext context) {
    BudgetEntryModel budgetEntryModel = BudgetEntryModel.getModel();
    SpendingModel spendingModel = SpendingModel.getModel();
    getBudgetDetails(
        budgetEntryModel: budgetEntryModel, spendingModel: spendingModel);
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xff26A3DB),
      appBar: CustAppBar(
        mode_name: "BUDGET MODE",
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30))),
              margin: EdgeInsets.zero,
              color: Color(0xff26A3DB),
              elevation: 20,
              child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: GestureDetector(
                    onTap: () async => await context.vxNav
                        .push(Uri.parse(MyRoutes.budgetEntrypageRoute)),
                    child: Container(
                      // color: Color(0x4F005484),
                      margin: EdgeInsets.zero,
                      child: Image(
                        image: Image.asset(
                                "assets/images/budget_planner_button.png")
                            .image,
                      ),
                    ),
                  )),
            ),
            Container(
                // margin: EdgeInsets.zero,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Card(
                          margin: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          color: Color(0xCCCBE6F2),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  height: 30,
                                  width:
                                      (MediaQuery.of(context).size.width) / 1.5,
                                  decoration: new BoxDecoration(
                                      color: Color(0xC5F38C49),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(30))),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          left: ((MediaQuery.of(context)
                                                      .size
                                                      .width) /
                                                  1.5) *
                                              0.55,
                                          child: DottedLine(
                                            dashLength: 1,
                                            dashGapLength: 1,
                                            lineThickness: 2,
                                            dashColor: Color(0xFFC6540C),
                                            dashGapColor: Colors.transparent,
                                            direction: Axis.vertical,
                                            lineLength: 150,
                                          )),
                                      Positioned(
                                          left: ((MediaQuery.of(context)
                                                      .size
                                                      .width) /
                                                  1.5) *
                                              ((spendingModel.travel == null ||
                                                      budgetEntryModel.travel ==
                                                          null ||
                                                      budgetEntryModel.travel ==
                                                          0)
                                                  ? 0.005
                                                  : (spendingModel.travel! /
                                                      (budgetEntryModel
                                                          .travel!))),
                                          child: Image(
                                              image: Image.asset(
                                                      "assets/images/travel_graph_driver.png")
                                                  .image))
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  height: 30,
                                  width:
                                      (MediaQuery.of(context).size.width) / 1.5,
                                  decoration: new BoxDecoration(
                                      color: Color(0x4FCC43995B),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(30))),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          left: ((MediaQuery.of(context)
                                                      .size
                                                      .width) /
                                                  1.5) *
                                              0.65,
                                          child: DottedLine(
                                            dashLength: 1,
                                            dashGapLength: 1,
                                            lineThickness: 2,
                                            dashColor: Color(0xFF278D44),
                                            dashGapColor: Colors.transparent,
                                            direction: Axis.vertical,
                                            lineLength: 150,
                                          )),
                                      Positioned(
                                          left:
                                              ((MediaQuery.of(context)
                                                          .size
                                                          .width) /
                                                      1.5) *
                                                  ((spendingModel.food ==
                                                              null ||
                                                          budgetEntryModel
                                                                  .food ==
                                                              null ||
                                                          budgetEntryModel
                                                                  .food ==
                                                              0)
                                                      ? 0.005
                                                      : (spendingModel.food! /
                                                          (budgetEntryModel
                                                              .food!))),
                                          child: Image(
                                              image: Image.asset(
                                                      "assets/images/food_graph_driver.png")
                                                  .image))
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  height: 30,
                                  width:
                                      (MediaQuery.of(context).size.width) / 1.5,
                                  decoration: new BoxDecoration(
                                      color: Color(0xCC005484),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(30))),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          left: ((MediaQuery.of(context)
                                                      .size
                                                      .width) /
                                                  1.5) *
                                              0.75,
                                          child: DottedLine(
                                            dashLength: 1,
                                            dashGapLength: 1,
                                            lineThickness: 2,
                                            dashColor: Color(0xFF042F46),
                                            dashGapColor: Colors.transparent,
                                            direction: Axis.vertical,
                                            lineLength: 150,
                                          )),
                                      Positioned(
                                          left: ((MediaQuery.of(context)
                                                      .size
                                                      .width) /
                                                  1.5) *
                                              ((spendingModel.entertainment ==
                                                          null ||
                                                      budgetEntryModel
                                                              .entertainment ==
                                                          null ||
                                                      budgetEntryModel
                                                              .entertainment ==
                                                          0)
                                                  ? 0.005
                                                  : (spendingModel
                                                          .entertainment! /
                                                      (budgetEntryModel
                                                          .entertainment!))),
                                          child: Image(
                                              image: Image.asset(
                                                      "assets/images/entertainment_graph_driver.png")
                                                  .image))
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  height: 30,
                                  width:
                                      (MediaQuery.of(context).size.width) / 1.5,
                                  decoration: new BoxDecoration(
                                      color: Color(0xC5ED847E),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(30))),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          left: ((MediaQuery.of(context)
                                                      .size
                                                      .width) /
                                                  1.5) *
                                              0.65,
                                          child: DottedLine(
                                            dashLength: 1,
                                            dashGapLength: 1,
                                            lineThickness: 2,
                                            dashColor: Color(0xFFAF4908),
                                            dashGapColor: Colors.transparent,
                                            direction: Axis.vertical,
                                            lineLength: 150,
                                          )),
                                      Positioned(
                                          left: ((MediaQuery.of(context)
                                                      .size
                                                      .width) /
                                                  1.5) *
                                              ((spendingModel.shopping ==
                                                          null ||
                                                      budgetEntryModel
                                                              .shopping ==
                                                          null ||
                                                      budgetEntryModel
                                                              .shopping ==
                                                          0)
                                                  ? 0.005
                                                  : (spendingModel.shopping! /
                                                      (budgetEntryModel
                                                          .shopping!))),
                                          child: Image(
                                              image: Image.asset(
                                                      "assets/images/shopping_graph_driver.png")
                                                  .image))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Card(
                                    elevation: 0,
                                    child: GestureDetector(
                                        onTap: () async =>
                                            await context.vxNav
                                                .push(
                                                    Uri.parse(
                                                        MyRoutes.webRoute),
                                                    params: {
                                                  "url":
                                                      "https://www.coupondunia.in/category/travel"
                                                }),
                                        child: Image(
                                            image: Image.asset(
                                                    "assets/images/travel_coupon.png")
                                                .image))),
                                Card(
                                    elevation: 0,
                                    child: GestureDetector(
                                        onTap: () async =>
                                            await context.vxNav
                                                .push(
                                                    Uri.parse(
                                                        MyRoutes.webRoute),
                                                    params: {
                                                  "url":
                                                      "https://www.coupondunia.in/category/fashion"
                                                }),
                                        child: Image(
                                            image: Image.asset(
                                                    "assets/images/shopping_coupon.png")
                                                .image)))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Card(
                                    elevation: 0,
                                    child: GestureDetector(
                                        onTap: () async =>
                                            await context.vxNav
                                                .push(
                                                    Uri.parse(
                                                        MyRoutes.webRoute),
                                                    params: {
                                                  "url":
                                                      "https://www.coupondunia.in/category/cinema"
                                                }),
                                        child: Image(
                                            image: Image.asset(
                                                    "assets/images/entertainment_coupon.png")
                                                .image))),
                                Card(
                                    elevation: 0,
                                    child: GestureDetector(
                                        onTap: () async =>
                                            await context.vxNav
                                                .push(
                                                    Uri.parse(
                                                        MyRoutes.webRoute),
                                                    params: {
                                                  "url":
                                                      "https://www.coupondunia.in/category/food-and-dining"
                                                }),
                                        child: Image(
                                            image: Image.asset(
                                                    "assets/images/food_coupon.png")
                                                .image)))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Card(
                                    elevation: 0,
                                    child: GestureDetector(
                                        onTap: () async =>
                                            await context.vxNav
                                                .push(
                                                    Uri.parse(
                                                        MyRoutes.webRoute),
                                                    params: {
                                                  "url":
                                                      "https://www.grabon.in/travel-coupons/"
                                                }),
                                        child: Image(
                                            image: Image.asset(
                                                    "assets/images/travel_coupon.png")
                                                .image))),
                                Card(
                                    elevation: 0,
                                    child: GestureDetector(
                                        onTap: () async =>
                                            await context.vxNav
                                                .push(
                                                    Uri.parse(
                                                        MyRoutes.webRoute),
                                                    params: {
                                                  "url":
                                                      "https://www.grabon.in/electronics-coupons/"
                                                }),
                                        child: Image(
                                            image: Image.asset(
                                                    "assets/images/shopping_coupon.png")
                                                .image)))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Card(
                                    elevation: 0,
                                    child: GestureDetector(
                                        onTap: () async =>
                                            await context.vxNav
                                                .push(
                                                    Uri.parse(
                                                        MyRoutes.webRoute),
                                                    params: {
                                                  "url":
                                                      "https://www.grabon.in/entertainment-coupons/"
                                                }),
                                        child: Image(
                                            image: Image.asset(
                                                    "assets/images/entertainment_coupon.png")
                                                .image))),
                                Card(
                                    elevation: 0,
                                    child: GestureDetector(
                                        onTap: () async =>
                                            await context.vxNav
                                                .push(
                                                    Uri.parse(
                                                        MyRoutes.webRoute),
                                                    params: {
                                                  "url":
                                                      "https://www.grabon.in/groceries-coupons/"
                                                }),
                                        child: Image(
                                            image: Image.asset(
                                                    "assets/images/food_coupon.png")
                                                .image)))
                              ],
                            )
                          ],
                        ),
                      ),
                    ).expand()
                  ],
                )).expand()
          ],
        ),
      ),
    ));
  }
}
