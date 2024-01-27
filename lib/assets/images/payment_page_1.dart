import 'package:flutter/material.dart';
import 'package:food_booking/payment_page_2.dart';
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
    TextEditingController getName=TextEditingController();
    TextEditingController getNumber=TextEditingController();
    TextEditingController getAddress=TextEditingController();
    TextEditingController getPIN=TextEditingController();
    String productPrize = calcPrize(widget.labelText);
    Size screen = MediaQuery.of(context).size;
    double width = screen.width;
    double height = screen.height;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset(
                      widget.imageLink,
                      height: height / 5.25,
                      width: width / 3,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        widget.labelText,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        productPrize,
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
            const Text('Enter your address',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            createTextField('Name',getName),
            createTextField('Mobile Number',getNumber),
            createTextField('Address',getAddress),
            createTextField('PIN Code',getPIN),
            const SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                String name=getName.text;
                String mobileNumber=getName.text;
                String address=getAddress.text;
                String pin=getPIN.text;
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return PaymentPage2(
                    imageLink: widget.imageLink,
                    labelText: widget.labelText,
                    name: name,
                    mobileNumber: mobileNumber,
                    address: address,
                    pin: pin,
                  );
                },),);
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.redAccent),
              ),
              child: const Text(
                'Continue To Payment',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ProductDescription pd = ProductDescription();
  calcPrize(String labelText) {
    switch (labelText) {
      case 'Healthy':
        return pd.healthyPrice;
      case 'Pizza':
        return pd.pizzaPrice;
      case 'Burger':
        return pd.burgerPrice;
      case 'Rolls':
        return pd.rollsPrice;
      case 'Chinese':
        return pd.chinesePrice;
      case 'Home Cooked':
        return pd.homeCookedPrice;
      case 'Chicken':
        return pd.chickenPrice;
      case 'Fish':
        return pd.fishPrice;
    }
  }

  createTextField(String hintText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            )
        ),
      ),
    );
  }
}
