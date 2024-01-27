import 'package:flutter/material.dart';

class PaymentPage2 extends StatefulWidget {
  final String imageLink;
  final String labelText;
  final String name;
  final String mobileNumber;
  final String address;
  final String pin;
  const PaymentPage2({super.key,required this.imageLink,required this.labelText,required this.name,required this.mobileNumber,required this.address,required this.pin});

  @override
  State<PaymentPage2> createState() => _PaymentPage2State();
}

class _PaymentPage2State extends State<PaymentPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(widget.name),
          Text(widget.mobileNumber),
          Text(widget.address),
          Text(widget.pin),
        ],
      ),
    );
  }
}
