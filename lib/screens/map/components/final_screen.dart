import 'package:flutter/material.dart';
    
class FinalScreen extends StatefulWidget {
  const FinalScreen({Key key, this.fare}) : super(key: key);

  final int fare;

  @override
  _FinalScreenState createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: Image(image: AssetImage('assets/images/remittance-icon-18.png'))
              ),
              SizedBox(height: 15,),
              Text(
                "Ride Ended Please Collect ${widget.fare*0.8}from Passanger",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                )
              ),
              Text(
                "from Passanger",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                )
              ),
              FloatingActionButton.extended(
                onPressed: (){Navigator.pushNamed(context, '/home');},
                label: const Text('Proceed'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
