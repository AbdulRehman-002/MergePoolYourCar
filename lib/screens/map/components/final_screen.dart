import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:pool_your_car/components/default_button.dart';
import 'package:pool_your_car/models/RateUser.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:http/http.dart' as http;

class FinalScreen extends StatefulWidget {
  const FinalScreen({
    Key key,
    this.fare,
    this.passengers,
  }) : super(key: key);

  final int fare;
  final List passengers;

  @override
  _FinalScreenState createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  double _rating = 0;
  Future<RateUser> rateUser() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'PUT', Uri.parse('$myip/api/user/rateuser/${widget.passengers[0]}'));
    request.body = json.encode({"newrating": _rating.toInt()});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      cherryToastSuccess("User Rated Successfully", context);
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kPrimaryColor),
        title: const Text('Ride Ended'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image(
                    image: AssetImage('assets/images/remittance-icon-18.png'),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Ride Ended Please Collect",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(" Rs ${widget.fare * 0.8}",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
                Text(
                  "from Passenger",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Rate other user",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SmoothStarRating(
                  allowHalfRating: false,
                  onRated: (v) async {
                    setState(() {
                      this._rating = v;
                    });
                    print(_rating);
                    print(widget.passengers);
                    if (widget.passengers.isNotEmpty) {
                      await rateUser();
                    } else {
                      cherryToastError("No Passenger to rate", context);
                    }
                  },
                  starCount: 5,
                  rating: _rating,
                  size: 40.0,
                  isReadOnly: false,
                  color: kPrimaryColor,
                  borderColor: kPrimaryColor,
                  spacing: 0.0,
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 50,
                ),
                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  label: const Text(
                    'Proceed',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: kPrimaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
