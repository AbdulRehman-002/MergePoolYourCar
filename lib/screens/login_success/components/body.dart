import 'package:flutter/material.dart';
import 'package:pool_your_car/components/default_button.dart';
import 'package:pool_your_car/screens/home/home_screen.dart';
import 'package:pool_your_car/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Center(
          child: Image.asset(
            "assets/images/success.png",
            height: SizeConfig.screenHeight * 0.4, //40%
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Next",
            press: () {
              //Navigator.pushNamed(context, HomeScreen.routeName);
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
