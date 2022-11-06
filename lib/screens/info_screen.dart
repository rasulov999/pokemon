import 'package:flutter/material.dart';
import 'package:pokemon/utils/colors.dart';

import '../utils/images.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(padding: EdgeInsets.only(top: 52),
          color: MyColors.white,
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Image.asset(MyImages.logo,height: 88,width: 252,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
