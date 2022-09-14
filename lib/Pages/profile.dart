import 'dart:async';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:duration_button/duration_button.dart';

import '../Model/SO_details.dart';
import '../Model/user.dart';
import 'login.dart';
import 'notifications.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  // late SharedPreferences sharedPreferences;

  // @override
  // void initState() {
  //   super.initState();
  //   checkLoginStatus();
  // }
  //
  // checkLoginStatus() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  // }
  String not_validuser = "";

  Timer? timer;

  String Address = "";

  String location ='Null, Press Button';

  void initState() {
    super.initState();
    Test();
    // timer = Timer.periodic(Duration(seconds: 1), (Timer t) => Test());
  }

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // user_details ud= user_details(user_id: 0, position: "", employee_id: 0, employee_pin: "", name: "", email: "", dob: "", profilr_image: "");
  user_login instance = new user_login(
      status: false,
      message: "",
      user: user_details(
          user_id: 0,
          position: "",
          employee_id: 0,
          employee_pin: "",
          name: "",
          email: "",
          dob: "",
          profilr_image: ""),
      access_token: "");

  so_details instance1 = new so_details(
      so_name: "",
      cases: "",
      date: "",
      person: "",
      code: "",
      document: "",
      amount: "",
      picture: "");


  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(()  {
    });
  }

  Future<void> Test() async {
    Position position = await _getGeoLocationPosition();
    GetAddressFromLatLong(position);
  }


  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFE2E2E2),
          appBar: AppBar(
              title: const Text('Profile',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              backgroundColor: Color(0xFF004D40),
              actions: <Widget>[
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Color(0xFF444446),
                  child: ClipOval(
                    child: Image.network(
                        'https://upstdc.co.in/AgentImage/default.jpg',
                        height: 30,
                        width: 30),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  tooltip: 'Show Snackbar',
                  onPressed: () { Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Notifications()),);
                  },
                ),
              ]),
          body: FutureBuilder(
              future: instance1.fetchSO(),
              builder: (context, data) {
                if (data.hasError) {
                  return Center(
                    child: Text("${data.error}"),
                  );
                } else if (data.hasData) {
                  var items = data.data as List<so_details>;
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(height: screenheight*0.02),
                        Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(25))),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xFF6be585),
                                    Color(0xFF240b36),
                                  ],
                                )),
                            padding: new EdgeInsets.all(screenheight*0.03),
                            height: MediaQuery.of(context).size.height * 0.28,
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: SafeArea(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                                radius: 35,
                                                child: ClipOval(
                                                  child: Image.network(
                                                      items[0].picture,
                                                      height: 100,
                                                      width: 100),
                                                )),
                                          ])),
                                  SizedBox(height: screenheight*0.01),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      items[0].person,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(height: 6.0),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'BP ID: ' + items[0].so_name,
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(height: 14.0),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Sergent, Traffic, Dhaka, MetroPoliton Police',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenheight*0.02),
                        Container(
                          padding: new EdgeInsets.all(screenheight*0.05),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(35),
                                  topLeft: Radius.circular(35)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                )
                              ]),
                          height: screenheight,
                          width: screenwidth,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Duty Today',
                                  textScaleFactor: 2,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 9),
                                ),
                                SizedBox(height: screenheight*0.01),
                                Text(
                                  'Tejgao Industrial Aria, Dhaka',
                                  textScaleFactor: 2,
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 8),
                                ),
                                SizedBox(height: screenheight*0.01),
                                Padding(
                                  padding: new EdgeInsets.only(
                                      bottom: screenheight*0.01, top: screenheight*0.03),
                                  child: Text(
                                    'Current Location',
                                    textScaleFactor: 2,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 9),
                                  ),
                                ),

                                SizedBox(height: screenheight*0.01),
                                Address == '' ?
                                    Container(
                                      child: Center(
                                        child: SpinKitCircle(
                                          size: 40,
                                          duration: const Duration(seconds: 2),
                                          color: Color(0xFF3eb489),
                                        ),
                                      ),
                                      height: MediaQuery.of(context).size.height * 0.04,
                                    ) :
                                Text( '${Address}', textAlign: TextAlign.left, style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15),),

                                SizedBox(height: screenheight*0.05),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFFCDE1DD),
                                  ),

                                  child: FlatButton(
                                    color: Color(0xFFCDE1DD),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Text(
                                          'Software Update',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                            Alignment.centerRight,
                                            child: Icon(
                                              Icons.arrow_right,
                                              color: Colors.black54,
                                              size: 50,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // ),
                                ),
                                SizedBox(height: screenheight*0.05),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF004D40),
                                  ),

                                  child: FlatButton(
                                    color: Color(0xFF004D40),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    onPressed: () async {
                                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                      await sharedPreferences.clear();

                                      Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Login()), (Route<dynamic> route) => false);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.logout,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Sign Out',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                  // ),
                                ),
                                SizedBox(height: 20.0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              })),
    );
  }
}
