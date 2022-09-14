import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/UseCaseEntry_Model.dart';
import '../PageView/PageViewDriving.dart';
import '../PageView/PageViewEngine.dart';
import '../PageView/PageViewVehicle.dart';
import '../Pages/notifications.dart';
import '../Service/Sharedpreferences_service.dart';
import '../Service/UseCaseEntry_service.dart';


class UseCaseEntry extends StatefulWidget {
  const UseCaseEntry({Key? key}) : super(key: key);

  @override
  State<UseCaseEntry> createState() => _UseCaseEntryState();
}

class _UseCaseEntryState extends State<UseCaseEntry> {


  String not_validuser = "";

  int UseCase_id = 0;
  List<UseCase_Data> UseCase_data = [];

  void get_data() async {
    var UseCase = await UseCase_service().getUseCase_Data();

    setState(() {
      this.UseCase_data = UseCase;
    });
  }

  void initState() {
    super.initState();
    this.get_data();
    this.NullSP();
  }
  void NullSP() async {
    final prefs = await SharedPreferences.getInstance();

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
    var screenheight = MediaQuery
        .of(context)
        .size
        .height;
    var screenwidth = MediaQuery
        .of(context)
        .size
        .width;

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
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Notifications()),);
                  },
                ),
              ]),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15.0),
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
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.25,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.1,
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width *
                                  0.8,
                              child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'What Do You\nWant To\n Use For\nCase Entry',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 25),
                                    ),
                                    Expanded(
                                      child: Image(
                                        image: AssetImage(
                                            'images/traffic_police.png'),
                                        height: screenheight / 5,),
                                    )
                                  ])),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(50),
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
                          'What do you want to use for case entry',
                          textScaleFactor: 2,
                          style: TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ),

                        if(UseCase_data.length != 0)...[
                          ..._UseCaseEntryList(),]else...[
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

  _UseCaseEntryList() {
    List<Padding> temp = [];
    for (var q = 0; q < this.UseCase_data.length; q++) {
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
                keyname= "UseCaseType";
                Sharedpreferences_service().keep_case_data_int(keyname, UseCase_data[q].id);

                if (UseCase_data[q].name == 'Vehicle Series Information') {
                  Navigator.of(context,
                      rootNavigator: true)
                      .push(MaterialPageRoute(
                    builder: (_) => PageViewCase(),
                  ));
                } else if (UseCase_data[q].name == 'Driving License') {
                Navigator.of (context,
                rootNavigator: true)
                .push(MaterialPageRoute(
                builder: (_) => PageViewDriving(),
                ));
                } else if (UseCase_data[q].name == 'Engine/Cassis Number') {
                  Navigator.of (context,
                      rootNavigator: true)
                      .push(MaterialPageRoute(
                    builder: (_) => PageViewEngine(),
                  ));
                }
              },


              child: Row(
                children: [
                  Text(
                    UseCase_data[q].name,
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
          ),
        ),

      );
    }
    return temp;
  }

}
