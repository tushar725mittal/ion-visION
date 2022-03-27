import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class NFTPage extends StatelessWidget {
  const NFTPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFCBE6F2),
      child: Column(
        children: const [
          Text(
            "COMING SOON",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 180, 26, 26)),
          ),
          Text(
            "Vision Coin - Buy NFTs the easy way",
            style: TextStyle(
                fontSize: 15, color: Color.fromARGB(255, 214, 32, 32)),
          ),
        ],
      ).centered(),
    );
  }
}
