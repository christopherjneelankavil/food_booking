import 'package:flutter/material.dart';
import 'package:food_booking/product_description.dart';

class PaymentPage1 extends StatefulWidget {
  final String imageLink;
  final String labelText;
  const PaymentPage1(
      {super.key, required this.imageLink, required this.labelText});

  @override
  State<PaymentPage1> createState() => _PaymentPage1State();
}

class _PaymentPage1State extends State<PaymentPage1> {
  @override
  Widget build(BuildContext context) {
    String productPrize=calcPrize(widget.labelText);
    Size screen=MediaQuery.of(context).size;
    double width=screen.width;
    double height=screen.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.redAccent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset(widget.imageLink,
                    height: height/5.25,
                    width: width/3,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(widget.labelText,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(productPrize,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

ProductDescription pd= ProductDescription();
  calcPrize(String labelText) {
    switch (labelText) {
    case 'Healthy': return pd.healthyPrice;
    case 'Pizza'  : return pd.pizzaPrice;
    case 'Burger' : return pd.burgerPrice;
    case 'Rolls'  : return pd.rollsPrice;
    case 'Chinese': return pd.chinesePrice;
    case 'Home Cooked': return pd.homeCookedPrice;
    case 'Chicken': return pd.chickenPrice;
    case 'Fish'   : return pd.fishPrice;
    }
  }
}
