import 'package:flutter/material.dart';
import 'package:food_booking/assets/images/payment_page_1.dart';
import 'package:food_booking/product_description.dart';

class SecondPage extends StatefulWidget {
  final String imageLink;
  final String labelText;

  const SecondPage(
      {super.key, required this.imageLink, required this.labelText});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {

    Size screen = MediaQuery.of(context).size;
    double width = screen.width;
    double height = screen.height;
    String currText = selectText(widget.labelText);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.redAccent,
        title: Text(
          widget.labelText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  top: 140,
                  child: Container(
                    width: width,
                    height: 500,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(100, 194, 194, 194),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image.asset(
                        widget.imageLink,
                        width: width / 2,
                        height: height / 3.5,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                color: Color.fromARGB(100, 194, 194, 194),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      currText,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return  PaymentPage1(
                              imageLink: widget.imageLink,
                              labelText: widget.labelText,
                            );
                          },
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.redAccent),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Book Now",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //methods and objects
  ProductDescription pd = ProductDescription();

  selectText(String labelText) {
    switch (labelText) {
      case 'Healthy':
        return pd.healthy;
      case 'Pizza':
        return pd.pizza;
      case 'Burger':
        return pd.burger;
      case 'Rolls':
        return pd.rolls;
      case 'Chinese':
        return pd.chinese;
      case 'Home Cooked':
        return pd.homeCooked;
      case 'Chicken':
        return pd.chicken;
      case 'Fish':
        return pd.fish;
    }
  }
}
