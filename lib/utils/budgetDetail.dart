import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:vision/models/budget_entry_model.dart';
import 'package:vision/models/spending_model.dart';

getBudgetDetails(
    {@required BudgetEntryModel? budgetEntryModel,
    SpendingModel? spendingModel}) async {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User? user = _auth.currentUser;

  firebaseFirestore
      .collection('users')
      .doc(user!.uid)
      .collection("budgetInfo")
      .doc("BudgetEntry")
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      budgetEntryModel!.entertainment = documentSnapshot.get("entertainment");
      budgetEntryModel.food = documentSnapshot.get("food");
      budgetEntryModel.shopping = documentSnapshot.get("shopping");
      budgetEntryModel.travel = documentSnapshot.get("travel");
    } else {
      budgetEntryModel!.entertainment = 0;
      budgetEntryModel.food = 0;
      budgetEntryModel.shopping = 0;
      budgetEntryModel.travel = 0;
    }
  });

  if (spendingModel != null) {
    firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .collection("budgetInfo")
        .doc("SpendingInfo")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        spendingModel.entertainment = documentSnapshot.get("entertainment");
        spendingModel.food = documentSnapshot.get("food");
        spendingModel.shopping = documentSnapshot.get("shopping");
        spendingModel.travel = documentSnapshot.get("travel");
      } else {
        spendingModel.entertainment = 0;
        spendingModel.food = 0;
        spendingModel.shopping = 0;
        spendingModel.travel = 0;
      }
    });
  }

  return;
}
