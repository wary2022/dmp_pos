import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:uniPolice/Pages/payment.dart';
import '../Model/FinalCaseData_model.dart';
import '../Service/FinalCaseData_service.dart';


class TodayHistory extends StatefulWidget {
  const TodayHistory({Key? key}) : super(key: key);

  @override
  State<TodayHistory> createState() => _TodayHistoryState();
}

class _TodayHistoryState extends State<TodayHistory> {
  String not_validuser = "";
  bool isLoading = false;

  int FinalCaseData_id=0;
  List<FinalCaseData> case_data=[];

  void get_data() async{
    var BeforeFinalCase = await FinalCaseData_service().getFinalCaseData();
    var FinalCase = BeforeFinalCase.reversed.toList();


    DateTime dateToday = new DateTime.now();
    String date = dateToday.toString().substring(0,10);
    case_data = [];
    for(var case_data_single in FinalCase) {
      setState((){
        isLoading = false;
      });
      if(case_data_single.caseDate == date){
        setState(() {
          this.case_data.add(case_data_single);
        });
      }
    }
  }



  void initState() {
    super.initState();
    isLoading = true;
    this.get_data();
  }


  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: isLoading == true
              ? Center(
                  child: SpinKitFadingCircle(
                    size: 80,
                    duration: const Duration(seconds: 2),
                    color: Color(0xFF3eb489),
                  ),
                )
              : case_data.length != 0? ListView.builder(
            padding: new EdgeInsets.only(top: screenheight * 0.01),
            itemCount:case_data.length,
            itemBuilder: (context, index) => Padding(
              padding: new EdgeInsets.only(bottom: screenheight * 0.02),
              // child: _TodayHistoryList(),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0XFFB7E9F7),
                          Color(0XFFDBF3FA),
                        ],
                      )),
                  padding: new EdgeInsets.only(
                      top: screenheight * 0.02,
                      right: screenwidth * 0.03,
                      left: screenwidth * 0.03,
                      bottom: 0),
                  height: MediaQuery.of(context).size.height * 0.295,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Row(children: [
                            Text(
                              'Case ID  #' + case_data[index].name.toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Expanded(
                              child: Text(
                                case_data[index].casType,
                                textAlign: TextAlign.end,
                                style:
                                TextStyle(color: Colors.red, fontSize: 14),
                              ),
                            ),
                          ])),
                      SizedBox(height: screenheight * 0.01),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              'Date: ' + case_data[index].caseDate.toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenheight * 0.003),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                              new EdgeInsets.only(top: screenheight * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text(
                                    'Accused Persion: ' + case_data[index].accusedPersonName,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  SizedBox(height: 8.0),
                                  new Text(
                                    'Procecution Code: ' + case_data[index].caseProcecution,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  SizedBox(height: 8.0),
                                  new Text(
                                    'Seized Documents: ' + case_data[index].seizedDocument,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      new Text(
                                        'Penalty Ammount: ' + case_data[index].penaltyAmount.toString() + ' BDT',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      if(case_data[index].status == "paid")...[
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          ' Paid ',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor:
                                            MaterialStateProperty.all(
                                                Color(0xFF004D40)),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(25),
                                                ))),
                                      ),] else if(case_data[index].status == "cancel")...[
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            ' Cancled ',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xFF004D40)),
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(25),
                                                  ))),
                                        ),]else...[
                                        ElevatedButton(
                                          onPressed: () {
                                            String id = case_data[index].name;
                                            Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder:(BuildContext context)=>Payment(ID: id,)));

                                          },
                                          child: Text(
                                            ' Pay Now ',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xFFC71414)),
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(25),
                                                  ))),
                                        )

                                      ],
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ): Center(
              child: Center(child: Text("No Case Found"))
          ),
          // Center(
          //   child: SpinKitFadingCircle(
          //     size: 80,
          //     duration: const Duration(seconds: 2),
          //     color: Color(0xFF3eb489),
          //   ),
          // )
        ));
  }


}
