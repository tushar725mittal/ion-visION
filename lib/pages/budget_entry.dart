import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vision/models/budget_entry_model.dart';
import 'package:vision/utils/budgetDetail.dart';

class BudgetEntryPage extends StatefulWidget {
  @override
  State<BudgetEntryPage> createState() => _BudgetEntryPageState();
}

class _BudgetEntryPageState extends State<BudgetEntryPage> {
  final foodController = TextEditingController();
  final shoppingController = TextEditingController();
  final travelController = TextEditingController();
  final entertainmentController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool changeButton = false;
  BudgetEntryModel budgetEntryModel = BudgetEntryModel.getModel();
  final _formkey = GlobalKey<FormState>();

  signUP(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        budgetEntryModel.food = num.parse(foodController.text);
        budgetEntryModel.shopping = num.parse(shoppingController.text);
        budgetEntryModel.travel = num.parse(travelController.text);
        budgetEntryModel.entertainment =
            num.parse(entertainmentController.text);
        changeButton = true;
      });

      try {
        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

        User? user = _auth.currentUser;

        await firebaseFirestore
            .collection("users")
            .doc(user!.uid)
            .collection("budgetInfo")
            .doc("BudgetEntry")
            .set(budgetEntryModel.toMap());
        await Future.delayed(Duration(milliseconds: 500));
        context.vxNav.pop();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-email') {
          print("Your email address appears to be malformed.");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: "Signing in with Email and Password is not enabled."
                  .text
                  .make()));
        } else if (e.code == 'operation-not-allowed') {
          print("Signing in with Email and Password is not enabled.");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: "Signing in with Email and Password is not enabled."
                  .text
                  .make()));
        } else if (e.code == 'too-many-requests') {
          print("Signing in with Email and Password is not enabled.");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: "Signing in with Email and Password is not enabled."
                  .text
                  .make()));
        }
      }
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    foodController.dispose();
    travelController.dispose();
    shoppingController.dispose();
    entertainmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getBudgetDetails(budgetEntryModel: budgetEntryModel);
    if (budgetEntryModel != null) {
      foodController.text = (budgetEntryModel.food).toString();
      shoppingController.text = (budgetEntryModel.shopping).toString();
      entertainmentController.text =
          (budgetEntryModel.entertainment).toString();
      travelController.text = (budgetEntryModel.travel).toString();
    }
    return Scaffold(
      // color: context.canvasColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Image.asset(
                  "assets/images/signup_upper.png",
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter the Entertainment Budget",
                          prefixIcon: Icon(Icons.movie),
                          labelText: "Entertainment Budget",
                        ),
                        controller: entertainmentController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Entertainment Budget cannot be empty(Min: ₹0.0)";
                          }
                          if (!value.isNumber()) {
                            return "Invalid Entry";
                          }

                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter the Food Budget",
                          prefixIcon: Icon(Icons.food_bank),
                          labelText: "Food Budget",
                        ),
                        controller: foodController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Food Budget cannot be empty(Min: ₹0.0)";
                          }
                          if (!value.isNumber()) {
                            return "Invalid Entry";
                          }

                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter the Shopping Budget",
                          prefixIcon: Icon(Icons.shopping_bag_outlined),
                          labelText: "Shopping Budget",
                        ),
                        controller: shoppingController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Shopping Budget cannot be empty(Min: ₹0.0)";
                          }
                          if (!value.isNumber()) {
                            return "Invalid Entry";
                          }

                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter the Travel Budget",
                          prefixIcon: Icon(Icons.train),
                          labelText: "Travel Budget",
                        ),
                        controller: travelController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Travel Budget cannot be empty(Min: ₹0.0)";
                          }
                          if (!value.isNumber()) {
                            return "Invalid Entry";
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Material(
                        color: context.theme.buttonColor,
                        borderRadius: changeButton
                            ? BorderRadius.circular(50)
                            : BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () => signUP(context),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            width: changeButton ? 50 : 120,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "SUBMIT",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          ),
                        ),
                      ),
                      Image(
                          image:
                              Image.asset("assets/images/vision_logo_white.png")
                                  .image),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Image.asset(
                  "assets/images/signup_lower.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
