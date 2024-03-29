import 'package:flutter/material.dart';
import 'package:pool_your_car/size_config.dart';

import '../../constants.dart';
import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
        iconTheme: IconThemeData(color: kPrimaryColor),
      ),
      body: Body(),
    );
  }
}
