import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String imageLink;
  final String labelText;
  const SecondPage(
      {super.key, required this.imageLink, required this.labelText});

  @override
  Widget build(BuildContext context) {
    Size screen=MediaQuery.of(context).size;
    double width=screen.width;
    double height=screen.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.redAccent,
        title: Text(labelText,
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
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image.asset(imageLink,
                        width: width/2,
                        height: height/3.5,
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
            )
          ],
        ),
      ),
    );
  }
}
