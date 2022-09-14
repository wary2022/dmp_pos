import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniPolice/CaseEntry/use_CaseEntry.dart';
import '../Model/CaseType_Model.dart';
import '../Pages/notifications.dart';
import '../Service/CaseType_service.dart';
import '../Service/Sharedpreferences_service.dart';


class CaseEntry extends StatefulWidget {
  const CaseEntry({Key? key}) : super(key: key);

  @override
  State<CaseEntry> createState() => _CaseEntryState();
}

class _CaseEntryState extends State<CaseEntry> {


  String not_validuser = "";

  int caseType_id=0;
  List<CaseType_Data> caseType_data=[];
  void get_data() async{
    var CaseData=await CaseType_service().getCaseType_Data();

    setState(() {
      this.caseType_data=CaseData;
    });
  }

  void initState() {
    super.initState();
    this.get_data();
    this.NullSP();
  }
  void NullSP() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString("CaseType", "");
    prefs.setString("UseCaseType", "");
    prefs.setString("CaseAria", "");
    prefs.setString("Reg_group", "");
    prefs.setString("vehicle_number", "");
    prefs.setString("ProcecutionCode", "");
    prefs.setString("SeizedDocs", "");
    prefs.setString("persionName", "");
    prefs.setString("father_name", "");
    prefs.setString("mobile_number", "");
    prefs.setString("person_address", "");
    prefs.setString("miscellaneousType", "");
    prefs.setString("selectReason", "");
    prefs.setString("witnessId", "");
    prefs.setString("uploadedFile", "");
    prefs.setString("license_number", "");
    prefs.setString("vehicle_engine_number", "");
    prefs.setString("vehicle_chassis_number", "");
    prefs.setString("filename", "null");
  }

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFF1F1F1),
          appBar: AppBar(
              title: const Text('Case Entry',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              backgroundColor: Color(0xFF004D40),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.notifications),
                  tooltip: 'Show Snackbar',
                  onPressed: () { Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Notifications()),);
                  },
                ),
              ]),
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
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.8,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Define The\nType Of Case',
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
                          padding: new EdgeInsets.all(screenheight/20),
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
                                  'Define the type of case',
                                  textScaleFactor: 2,
                                  style: TextStyle(
                                      color: Colors.black26,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),

                               if(caseType_data.length != 0)...[
                                ..._CaseTypeList(),]else...[
                                      Padding(
                                        padding: new EdgeInsets.only(top: screenheight/6),
                                        child: Center(
                                        child: SpinKitThreeBounce(
                                        size: 50,
                                          duration: const Duration(seconds: 2),
                                          color: Color(0xFF3eb489),
                                        ),),
                                      ),
                               ],

                                Expanded(
                                    child:
                                    SizedBox(height: screenheight / 1)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                        ),
    );
  }


  _CaseTypeList() {
    List<Padding> temp = [];
    for (var q = 0; q<this.caseType_data.length; q++) {
      temp.add(
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFE6E6FA),
            ),
            child: FlatButton(
              color: Color(0xFFE6E6FA),
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(10)),
              onPressed: () {
                String keyname;
                keyname= "CaseType";
                Sharedpreferences_service().keep_case_data_int(keyname, caseType_data[q].id);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UseCaseEntry()),
                );
              },
              child: Row(
                children: [
                  Text(
                    caseType_data[q].name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
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
          )
        ),

      );
    }
    return temp;

  }
}


