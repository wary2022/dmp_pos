import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Service/Sharedpreferences_service.dart';

class PersionInformation extends StatefulWidget {
  const PersionInformation({Key? key}) : super(key: key);

  @override
  State<PersionInformation> createState() => _PersionInformationState();
}

class _PersionInformationState extends State<PersionInformation> {
  String not_validuser = "";
  String persion_Name = "";
  String fatherName = "";
  String MobNumber = "";
  String persionAddress = "";

  void initState() {
    super.initState();
    this.printfunc();
    DataCall();
  }

  void DataCall() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
    this.persion_Name = prefs.getString('persionName').toString();
    this.fatherName = prefs.getString('father_name').toString();
    this.MobNumber = prefs.getString('mobile_number').toString();
    this.persionAddress = prefs.getString('person_address').toString();});
  }


  String Print = "";
  void printfunc() async {
    final prefs = await SharedPreferences.getInstance();
    this.Print = prefs.getString('ProcecutionCode')!;
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
                            new EdgeInsets.only(top: screenheight*0.02, bottom: screenheight*0.02),
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
                                                'Provide\nAccused\nPerson\nInformation',
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
                            padding: new EdgeInsets.all(screenheight*0.03),
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
                                    'Provide accused person information',
                                    textScaleFactor: 2,
                                    style: TextStyle(
                                        color: Colors.black26,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),

                                  Padding(
                                    padding: new EdgeInsets.only(top: screenheight*0.03),
                                    child: TextFormField(
                                      controller: TextEditingController(text: persion_Name),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(0, -5, 0, -5),
                                        labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xFF004D40)),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        prefixIcon: Icon(Icons.person),
                                        hintText: 'Enter Name',
                                      ),
                                      onChanged: (text){
                                        String keyname;
                                        keyname= "persionName";
                                        Sharedpreferences_service().keep_case_data_string(keyname, text);
                                      },
                                    ),
                                  ),
                                  SizedBox(height: screenheight*0.02),
                                  TextFormField(
                                    controller: TextEditingController(text: fatherName),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(0, -5, 0, -5),
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xFF004D40)),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      prefixIcon: Icon(Icons.account_box),
                                      hintText: 'Enter Father Name',
                                    ),
                                    onChanged: (text){
                                      String keyname;
                                      keyname= "father_name";
                                      Sharedpreferences_service().keep_case_data_string(keyname, text);
                                    },
                                  ),
                                  Padding(
                                    padding: new EdgeInsets.only(top: screenheight*0.02),
                                    child: TextFormField(
                                      controller: TextEditingController(text: MobNumber),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(0, -5, 0, -5),
                                        labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xFF004D40)),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        prefixIcon: Icon(Icons.call),
                                        hintText: 'Enter Mobile Number',
                                      ),
                                      onChanged: (text){
                                        String keyname;
                                        keyname= "mobile_number";
                                        Sharedpreferences_service().keep_case_data_string(keyname, text);
                                      },
                                    ),
                                  ),
                                  SizedBox(height: screenheight*0.02),
                                  TextFormField(
                                    controller: TextEditingController(text: persionAddress),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(0, -5, 0, -5),
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xFF004D40)),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      prefixIcon: Icon(Icons.location_on),
                                      hintText: 'Enter Address',
                                    ),
                                    onChanged: (text){
                                      String keyname;
                                      keyname= "person_address";
                                      Sharedpreferences_service().keep_case_data_string(keyname, text);
                                    },
                                  ),
                                  SizedBox(height: screenheight*0.06),
                                  Text(
                                    'Location will be traced by default using device location',
                                    textScaleFactor: 2,
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 7),
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
