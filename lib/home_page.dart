import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_booking/second_page.dart';
import 'package:food_booking/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final imgLink = [
    'lib/assets/images/offer1.jpeg',
    'lib/assets/images/offer2.jpeg',
    'lib/assets/images/offer3.jpeg',
    'lib/assets/images/offer4.jpeg',
    'lib/assets/images/offer5.jpeg'
  ];

  String dropDownVal = 'Item 1';

  var items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  Widget build(BuildContext context) {
    Size scrnSize = MediaQuery.of(context).size;
    double width = scrnSize.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: Container(
          //If background color needed
          // color: Colors.red,
          height: 230,
          child: SafeArea(
            child: ListTile(
              title: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 24,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: width / 30,
                      ),
                      const Text(
                        '25-B,Anonymous Nagar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        width: width / 27,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(8.0),
                          shape: MaterialStateProperty.all(
                            const CircleBorder(eccentricity: 0.0),
                          ),
                        ),
                        child: const Icon(
                          Icons.person_2_sharp,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 16, 6, 16),
                    child: textField(),
                  ),
                  Container(
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.white;
                                  }
                                  return Colors.grey;
                                },
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            child: const Text(
                              'Delivery',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.white;
                                }
                                return Colors.grey;
                              },
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Self-Pickup',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CarouselSlider.builder(
              itemCount: imgLink.length,
              itemBuilder: (context, index, realIndex) {
                final imglink = imgLink[index];
                return buildImg(imglink, index);
              },
              options: CarouselOptions(height: 200),
            ),
            const SizedBox(
              height: 8,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.sort_rounded,
                            color: Colors.red,
                          ),
                          Text(
                            'Sort   ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.red,
                          ),
                          // DropdownButton(
                          //   style: TextStyle(
                          //     backgroundColor: Color.fromARGB(300, 204, 185, 185),
                          //   ),
                          //   value: dropDownVal,
                          //   icon: Icon(Icons.keyboard_arrow_down),
                          //   items: items.map((String items){
                          //     return DropdownMenuItem(child: Text('Items'),);
                          //   },).toList(),onChanged: (String? newVal){
                          //     setState(() {
                          //       dropDownVal=newVal!;
                          //     },);
                          // }
                          //),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    buildBtn('Fast Delivery'),
                    const SizedBox(
                      width: 8,
                    ),
                    buildBtn('Great Offers'),
                    const SizedBox(
                      width: 8,
                    ),
                    buildBtn('Rated 4+'),
                    const SizedBox(
                      width: 8,
                    ),
                    buildBtn('Pure Veg'),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Eat what makes you happy',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      roundImageGenerate(
                          'lib/assets/images/healthy.jpeg', 'Healthy'),
                      SizedBox(
                        width: width / 22,
                      ),
                      roundImageGenerate(
                          'lib/assets/images/pizza.jpeg', 'Pizza'),
                      SizedBox(
                        width: width / 22,
                      ),
                      roundImageGenerate(
                          'lib/assets/images/burger.jpeg', 'Burger'),
                      SizedBox(
                        width: width / 22,
                      ),
                      roundImageGenerate(
                          'lib/assets/images/rolls.jpeg', 'Rolls'),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      roundImageGenerate(
                          'lib/assets/images/chinese_food.jpeg', 'Chinese'),
                      SizedBox(
                        width: width / 22,
                      ),
                      roundImageGenerate(
                          'lib/assets/images/home_cooked.jpeg', 'Home Cooked'),
                      SizedBox(
                        width: width / 22,
                      ),
                      roundImageGenerate(
                          'lib/assets/images/chicken.jpeg', 'Chicken'),
                      SizedBox(
                        width: width / 22,
                      ),
                      roundImageGenerate('lib/assets/images/fish.jpeg', 'Fish'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.home,
              //color: Colors.red,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ),
            );
          }
        },
        selectedIconTheme: const IconThemeData(color: Colors.red),
        selectedLabelStyle: const TextStyle(
          color: Colors.red,
        ),
        unselectedIconTheme: const IconThemeData(color: Colors.black),
        unselectedLabelStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  //methods
  textField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search restaurants or dishes...',
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.red,
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const VerticalDivider(
              color: Colors.black,
              thickness: 10,
              width: 8,
            ),
            TextButton(
              onPressed: () {},
              child: const Icon(
                Icons.mic,
                color: Colors.red,
              ),
            ),
          ],
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
    );
  }

  Widget buildImg(String imglink, int index) {
    return Container(
      // alignment: Alignment.topCenter,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imglink,
          fit: BoxFit.cover,
          width: 400,
          height: 150,
        ),
      ),
    );
  }

  buildBtn(String title) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  roundImageGenerate(imgLink, imgText) {
    Size scrSize = MediaQuery.of(context).size;
    double w = scrSize.width;
    double h = scrSize.height;
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(70.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  SecondPage(
                  imageLink: imgLink,
                  labelText: imgText,
                )),
              );
            },
            child: Image.asset(
              imgLink,
              width: w / 5,
              height: h / 8,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Text(imgText),
      ],
    );
  }
}
