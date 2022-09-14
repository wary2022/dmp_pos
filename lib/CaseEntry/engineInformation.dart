import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Service/Sharedpreferences_service.dart';

class EngineInformation extends StatefulWidget {
  const EngineInformation({Key? key}) : super(key: key);

  @override
  State<EngineInformation> createState() => _EngineInformationState();
}

class _EngineInformationState extends State<EngineInformation> {
  String not_validuser = "";
  String EngineNumber = "";
  String ChassisNumber = "";


  void initState() {
    super.initState();
    DataCall();
  }

  void DataCall() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      this.EngineNumber = prefs.getString('vehicle_engine_number').toString();
      this.ChassisNumber = prefs.getString('vehicle_chassis_number').toString();
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
                          Padding(
                            padding:
                            const EdgeInsets.only(top: 15, bottom: 15.0),
                            child: Card(
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
                                                'Provide\nEngine &\nChassis\nInformation',
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
                          ),
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
                                    'Provide engine & chassis information',
                                    textScaleFactor: 2,
                                    style: TextStyle(
                                        color: Colors.black26,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                  SizedBox(height: screenheight*0.05),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin:
                                    EdgeInsets.only(left: 10, right: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Enter Engine Number",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: screenheight*0.01),
                                  TextFormField(
                                    controller: TextEditingController(text: EngineNumber),
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
                                        padding:  new EdgeInsets.only(right: screenwidth/18),
                                        child: Icon(Icons.qr_code_2, size: 30,),
                                      ),
                                      hintText: 'Enter Engine Number',
                                    ),
                                    onChanged: (text){
                                      String keyname;
                                      keyname= "vehicle_engine_number";
                                      Sharedpreferences_service().keep_case_data_string(keyname, text);
                                    },
                                  ),
                                  SizedBox(height: screenheight*0.05),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin:
                                    EdgeInsets.only(left: 10, right: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Enter Chassis Number",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: screenheight*0.01),
                                  TextFormField(
                                    controller: TextEditingController(text: ChassisNumber),
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
                                        padding: new EdgeInsets.only(right: screenwidth/20),
                                        child: Icon(Icons.qr_code, size: 30,),
                                      ),
                                      hintText: 'Enter Chassis Number',
                                    ),
                                    onChanged: (text){
                                      String keyname;
                                      keyname= "vehicle_chassis_number";
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
                      ))),
    );
  }
}
