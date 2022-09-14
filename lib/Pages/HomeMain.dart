import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../Model/CaseType_Model.dart';
import '../Model/FinalCaseData_model.dart';
import '../Service/CaseType_service.dart';
import '../Service/FinalCaseData_service.dart';
import 'HomeInnerPage/licenseEnquiry.dart';
import 'Print.dart';
import 'notifications.dart';

class HomeMain extends StatefulWidget {
  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {

  String not_validuser = "";

  int FinalCaseData_id=0;
  List<FinalCaseData> case_data=[];
  void get_data() async{
    var FinalCase=await FinalCaseData_service().getFinalCaseData();

    setState(() {
      this.case_data=FinalCase;
    });
  }

  int caseType_id=0;
  List<CaseType_Data> caseType_data=[];
  void get_data2() async{
    var CaseData=await CaseType_service().getCaseType_Data();

    setState(() {
      this.caseType_data=CaseData;
    });
  }
  void initState() {
    super.initState();
    this.get_data();
    this.get_data2();
  }


  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xFF444446),
            appBar: AppBar(
                title: const Text('POS DMP',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                backgroundColor: Color(0xFF004D40),
                actions: <Widget>[
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(0xFF444446),
                    child: ClipOval(
                      child: Image.network(
                        'https://upstdc.co.in/AgentImage/default.jpg',
                          height: 30,
                          width: 30
                      ),
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
            body: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(height: screenheight*0.01),
                          Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: InkWell(
                              onTap: () {

                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Colors.blue,
                                        Colors.red,
                                      ],
                                    )),
                                padding: new EdgeInsets.all(screenwidth*0.04),
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width:
                                    MediaQuery.of(context).size.width / 1.1,
                                child: Padding(
                                  padding: new EdgeInsets.only(top: screenheight*0.01, bottom: screenheight*0.01),
                                  child: SafeArea(
                                    child: case_data.length != 0 ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,

                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: Color(0xFFEACE09),
                                              ),
                                              padding: new EdgeInsets.all(screenwidth/15),
                                              child: Text(
                                                case_data.length.toString(),
                                                style: TextStyle(fontSize: 22),
                                              ),
                                            ),
                                            SizedBox(height: screenheight*0.01),
                                            Text(
                                              'Total Cases',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                    ..._CaseCounter(),
                                        ])
                                      ],
                                    ): SpinKitPulse(
                                      color: Colors.blue,
                                  size: 100.0,
                                ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenheight*0.01),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(35),
                                  topLeft: Radius.circular(35)),
                              color: Colors.white,
                            ),
                            height: screenheight,
                            width: screenwidth,
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    padding: new EdgeInsets.all(screenheight/35),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Quick Enquiries',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(height: screenheight*0.03),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                            children: [
                                              Container(
                                                child: Align(
                                                    alignment:
                                                        Alignment.center,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Icon(
                                                          Icons.question_answer,
                                                          color: Colors.green,
                                                          size: screenheight*0.03,
                                                        ),
                                                        Text(
                                                          'Case Enquiry',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        )
                                                      ],
                                                    )

                                                    ),
                                                height:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        10,
                                                width:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2.4,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20),
                                                  color: Color(0xFFc5ebdd),
                                                ),
                                              ),
                                              Container(
                                                child: Align(
                                                    alignment:
                                                        Alignment.center,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                      Icon(
                                                      Icons.app_registration,
                                                      color: Colors.green,
                                                      size: screenheight*0.03,
                                                    ),
                                                    Text(
                                                      'Registration\nEnquiry',
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                    )
                                                ], )),
                                                height:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        10,
                                                width:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2.4,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20),
                                                  color: Color(0xFFfcdbdb),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: screenheight*0.02),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .push(
                                                    MaterialPageRoute(
                                                      builder: (_) => LicenseEnquiry(),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child:Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                        Icon(
                                                        Icons.drive_eta,
                                                        color: Colors.green,
                                                        size: screenheight*0.03,
                                                      ), Text(
                                                        'Driving License\nEnquiry',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ) ], )),
                                                  height:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          10,
                                                  width:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2.4,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Color(0xFFc8d4ff),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(context,
                                                      rootNavigator: true)
                                                      .push(
                                                    MaterialPageRoute(
                                                      builder: (_) => Prints(text: 'Hi This is Test',),
                                                    ),
                                                  );
                                                },
                                                child:Container(
                                                child: Align(
                                                    alignment:
                                                        Alignment.center,
                                                    child:Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                      Icon(
                                                      Icons.payment_outlined,
                                                      color: Colors.green,
                                                      size: screenheight*0.03,
                                                    ), Text(
                                                      'Case Payment\nStatus',
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                    ) ], )),
                                                height:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        10,
                                                width:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2.4,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20),
                                                  color: Color(0xFFeebbfa),
                                                ),
                                              ),),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: screenheight*0.02),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(
                                                child: Align(
                                                    alignment:
                                                    Alignment.center,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Icon(
                                                          Icons.print_outlined,
                                                          color: Colors.green,
                                                          size: screenheight*0.03,
                                                        ),
                                                        Text(
                                                          'Reprint Last\nCase', textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        )
                                                      ],
                                                    )

                                                ),
                                                height:
                                                MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                    10,
                                                width:
                                                MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    2.4,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      20),
                                                  color: Color(0xFFc5ebdd),
                                                ),
                                              ),
                                              Container(
                                                child: Align(
                                                    alignment:
                                                    Alignment.center,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Icon(
                                                          Icons.app_registration,
                                                          color: Colors.green,
                                                          size: screenheight*0.03,
                                                        ),
                                                        Text(
                                                          'Reprint any\nPrevious Case',
                                                          textAlign:
                                                          TextAlign.left,
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        )
                                                      ], )),
                                                height:
                                                MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                    10,
                                                width:
                                                MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    2.4,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      20),
                                                  color: Color(0xFFfcdbdb),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: screenheight*0.02),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(
                                                child: Align(
                                                    alignment:
                                                    Alignment.center,
                                                    child:Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Icon(
                                                          Icons.work_outline,
                                                          color: Colors.green,
                                                          size: screenheight*0.03,
                                                        ), Text(
                                                          'Duty\nDistribution',
                                                          textAlign:
                                                          TextAlign.left,
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ) ], )),
                                                height:
                                                MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                    10,
                                                width:
                                                MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    2.4,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      20),
                                                  color: Color(0xFFc8d4ff),
                                                ),
                                              ),
                                              Container(
                                                child: Align(
                                                    alignment:
                                                    Alignment.center,
                                                    child:Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Icon(
                                                          Icons.help_outline,
                                                          color: Colors.green,
                                                          size: screenheight*0.03,
                                                        ), Text(
                                                          'Get Help',
                                                          textAlign:
                                                          TextAlign.left,
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ) ], )),
                                                height:
                                                MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                    10,
                                                width:
                                                MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    2.4,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      20),
                                                  color: Color(0xFFeebbfa),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
          ),
        ));
  }

  _CaseCounter() {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    List<Column> temp = [];
    int Case = 0;

    for (var q = 0; q<this.caseType_data.length; q++) {
      Case = 0;
      for (var k = 0; k<this.case_data.length; k++) {
        if (case_data[k].casType == caseType_data[q].name) {
          Case = Case + 1;
        }
      }
      temp.add(
              Column(
                children: [
                  Container(
                    padding:
                    new EdgeInsets.all(screenwidth/50),
                    child: Text(
                      Case.toString(),
                      style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFFEACE09)),
                    ),
                  ),
                  Text(
                    caseType_data[q].name,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white),
                  )

                ],
              ),
      );
    }
    return temp;

  }
}
