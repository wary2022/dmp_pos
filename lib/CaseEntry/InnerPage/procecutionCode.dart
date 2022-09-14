import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Model/ProcecutionCode_Model.dart';
import '../../Service/ProcecutionCode_service.dart';
import '../../Service/Sharedpreferences_service.dart';

class ProcecutionCode extends StatefulWidget {
  const ProcecutionCode({Key? key}) : super(key: key);

  @override
  State<ProcecutionCode> createState() => _ProcecutionCodeState();
}

class _ProcecutionCodeState extends State<ProcecutionCode> {

  String not_validuser = "";
  String procecutionCode = "";

  int ProcecutionCode_id=0;
  List<ProcecutionCode_Data> ProcecutionCode_data=[];
  void get_data() async{
    var ProcecutionCode=await ProcecutionCode_service().getProcecutionCode_Data();

    setState(() {
      this.ProcecutionCode_data=ProcecutionCode;
    });
  }

  void initState() {
    super.initState();
    this.get_data();
    DataCall();
  }

  void DataCall() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    this.procecutionCode = prefs.getString('ProcecutionCode').toString();
  }

  List selectedData = [];

  List<String> TotalData = [];




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
                                                'Select\nProcecution\nCodes',
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
                            padding: new EdgeInsets.only(top: screenheight*0.04, right: screenwidth*0.04, left: screenwidth*0.04, bottom: screenheight*0.04),
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
                                      'Select procecution codes',
                                      textScaleFactor: 2,
                                      style: TextStyle(
                                          color: Colors.black26,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                    ),
                                  Padding(
                                    padding: new EdgeInsets.only(top: screenheight*0.01),
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      margin:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          "See Previous Cases",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: ProcecutionCode_data.length != 0 ?
                                      GridView.count(
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        crossAxisCount: 3,
                                        children: ProcecutionCode_data.map((e) {
                                          return Padding(
                                            padding: new EdgeInsets.only(top: screenheight*0.02, bottom: screenheight*0.05),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF3eb489),
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: CheckboxListTile(
                                                contentPadding: EdgeInsets.all(0),
                                                title: Text(e.name, style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),),
                                                value: selectedData.indexOf(e.id) < 0
                                                    ? false
                                                    : true,
                                                onChanged: (newValue) {
                                                  if (selectedData.indexOf(e.id) < 0) {
                                                    setState(() {
                                                      selectedData.add(e.id);
                                                      // TotalData = [];
                                                      for(int i=0; i<1;i++){
                                                        TotalData.add(e.id.toString());
                                                        // print(TotalData);
                                                      }
                                                    });
                                                  } else {
                                                    setState(() {
                                                      selectedData.removeWhere(
                                                          (element) => element == e.id);
                                                      for(int i=0; i<1;i++){
                                                        TotalData.remove(e.id);
                                                        print(TotalData);
                                                      }
                                                    });
                                                  }
                                                  print(TotalData);


                                                  String keyname;
                                                  keyname = "ProcecutionCode";
                                                  Sharedpreferences_service().keep_case_data_array(keyname, TotalData);
                                                },
                                                controlAffinity:
                                                    ListTileControlAffinity.leading,
                                                activeColor: Color(0xFF004D40),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ): Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: new EdgeInsets.only(top: screenheight/6),
                                            child: Center(
                                              child: SpinKitWave(
                                                size: 50,
                                                duration: const Duration(seconds: 2),
                                                color: Color(0xFF3eb489),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),

                        ],
                      ))
                )
    );
  }
}
