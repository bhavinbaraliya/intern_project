import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carbon_icons/carbon_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Index of the selected item

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final appBarHeight = screenHeight / 6;
    final appBarColor = const Color(0xFF354250); // Color of the app bar

    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: Stack(
          children: [
            Container(
              height: appBarHeight,
              color: appBarColor,
              child: const Center(
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        CarbonIcons.align_box_middle_left,
                        color: Colors.white,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.star_border_purple500_sharp,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Icon(
                            CarbonIcons.audio_console,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: appBarHeight / 2,
            width: double.infinity,
            color: appBarColor,
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              height: screenHeight - (appBarHeight / 2),
            ),
          ),
          Positioned(
            top: appBarHeight / 4 - 30,
            left: screenWidth * 0.05, // Centering the TextField
            right: screenWidth * 0.05, // Centering the TextField
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0, // soften the shadow
                    spreadRadius: 0, // extend the shadow
                    offset: Offset(
                      0.0, // Move to right 10 horizontally
                      0.0, // Move to bottom 10 vertically
                    ),
                  )
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.black26),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(15),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: const Color(0xFF60b526),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            selectedLabelStyle: const TextStyle(color: Colors.black),
            unselectedLabelStyle: const TextStyle(color: Colors.black26),
            selectedItemColor:
                appBarColor, // Set color to app bar color when selected
            unselectedItemColor:
                Colors.grey, // Set color to grey when not selected
            currentIndex: _selectedIndex, // Set the current selected index
            onTap: (index) {
              setState(() {
                _selectedIndex = index; // Update the selected index
              });
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt),
                label: 'Orders',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.window_outlined),
                label: 'Expense',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_repair_service_rounded),
                label: 'Manage',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_sharp),
                label: 'Account',
                backgroundColor: Colors.white,
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: screenWidth * 0.08 + _selectedIndex * (screenWidth * 0.18),
            child: Container(
              width: screenWidth * 0.1,
              height: 3,
              color: appBarColor,
            ),
          ),
        ],
      ),
    );
  }
}
