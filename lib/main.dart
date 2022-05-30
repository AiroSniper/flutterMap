import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_in_flutter/resturants.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import 'airoports.dart';
import 'dashboard.dart';
import 'foodLocations.dart';
import 'googleOffices.dart';
import 'my_drawer_header.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Lottie.asset("assets/splash.json"),
        backgroundColor: Colors.green,
        nextScreen: HomePage(),
        splashIconSize: 250,
        duration: 4000,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.leftToRightWithFade,
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.foodLocations) {
      container = FoodLocations();
    } else if (currentPage == DrawerSections.googleOffices) {
      container = GoogleOffcies();
    }
    else if (currentPage == DrawerSections.resturants) {
      container = ResturantsLocation();
    }
    else if (currentPage == DrawerSections.airoports) {
      container = AiroLocations();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text("Geolocator"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Cafes and Patesseries", Icons.food_bank_outlined,
              currentPage == DrawerSections.foodLocations ? true : false),
          menuItem(3, "Google offices", Icons.local_post_office_sharp,
              currentPage == DrawerSections.googleOffices ? true : false),
          menuItem(4, "Resturants", Icons.restaurant,
              currentPage == DrawerSections.resturants ? true : false),
          menuItem(5, "Airoports", Icons.airplanemode_active,
              currentPage == DrawerSections.airoports ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.foodLocations;
            } else if (id == 3) {
              currentPage = DrawerSections.googleOffices;
            }else if (id == 4) {
              currentPage = DrawerSections.resturants;
            }
            else if (id == 5) {
              currentPage = DrawerSections.airoports;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  foodLocations,
  googleOffices,
  resturants,
  airoports
}
