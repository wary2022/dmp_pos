import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Service/Sharedpreferences_service.dart';

class DrivingLicense extends StatefulWidget {
  const DrivingLicense({Key? key}) : super(key: key);

  @override
  State<DrivingLicense> createState() => _DrivingLicenseState();
}

class _DrivingLicenseState extends State<DrivingLicense> {
  String not_validuser = "";
  String DrivingLicense = "";


  void initState() {
    super.initState();
    DataCall();
  }

  void DataCall() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      this.DrivingLicense = prefs.getString('license_number').toString();
      });
  }



  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;


    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFF1F1F1),
          body: SingleChildScrollView(
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
                                      Color(0xFF0f0c29),
                                      Color(0xFF302b63),
                                      Color(0xFF24243e),
                                    ],
                                  )),
                              height:
                              MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      width:
                                      MediaQuery.of(context).size.width *
                                          0.8,
                                      child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              'Provide\nDriving\nLicense\nInformation',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 25),
                                            ),
                                            Expanded(
                                              child: Image(
                                                  image: AssetImage(
                                                      'images/traffic_police.png'), height: screenheight*0.2, width: screenwidth*0.4,),
                                            )
                                          ])),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: screenheight*0.02),
                          Container(
                            padding: new EdgeInsets.all(screenwidth/15),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Provide driving license information',
                                    textScaleFactor: 2,
                                    style: TextStyle(
                                        color: Colors.black26,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 40.0),
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      margin:
                                      EdgeInsets.only(right: 10),
                                      child:Text(
                                            "Enter Driving License Number",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ),
                                    ),
                                  ),
                                  SizedBox(height: screenheight*0.02),
                                  TextFormField(
                                    controller: TextEditingController(text: DrivingLicense),
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 5),
                                          borderRadius:
                                          BorderRadius.circular(
                                              10)),
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(right: 25.0),
                                        child: Icon(Icons.qr_code_scanner, size: 30,),
                                      ),
                                      hintText: 'Enter License Number',
                                    ),
                                    onChanged: (text){
                                      String keyname;
                                      keyname= "license_number";
                                      Sharedpreferences_service().keep_case_data_string(keyname, text);
                                    },
                                  ),




                                  Expanded(
                                      child:
                                      SizedBox(height: screenheight / 1)),

                                ],
                              ),
                            ),
                          ),
                        ],
                      )
          )
               ),
    );
  }
}
