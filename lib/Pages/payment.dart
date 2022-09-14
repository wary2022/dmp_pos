import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../Model/SingleCaseData_model.dart';
import '../Service/MainService.dart';
import '../Service/SingleCaseData_service.dart';
import 'package:http/http.dart' as http;

import 'notifications.dart';

class Payment extends StatefulWidget {
  String ID;

  Payment({required this.ID});

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  static const PrintChannel = const MethodChannel("com.dmppos.print/print");

  String not_validuser = "";
  int Documents_id = 0;
  List<SingleCaseData> SingleCase_data = [];
  final _SingleCaseIdController = TextEditingController();
  String Money = "";

  bool _loading = false;

  void initState() {
    super.initState();
    if (widget.ID != '') {
      _SingleCaseIdController.text = widget.ID;
      this._test();
    } else {
      _SingleCaseIdController.text = "";
    }
  }

  @override
  void _test() async {
    var response = await SingleCaseData_service()
        .getSingleCaseData(_SingleCaseIdController.text);
    setState(() {
      this.SingleCase_data = response;
    });
  }

  String caseId = "";
  String Amount = "";

  final String url = Url().url + "payment";
  final String token = Token().getToken();

  Future<String?> PaymentPost() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "access_token": token
    };
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);
    setState(() {
      this.caseId = SingleCase_data[0].name;
      this.Amount = SingleCase_data[0].penaltyAmount.toString();
    });
    request.fields['case_id'] = this.caseId;
    request.fields['penalty_amount'] = this.Amount;

    var res = await request.send();
    if (res.statusCode == 200) print('Uploaded!');
    return res.reasonPhrase;
  }

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFF4f4f4f),
          appBar: AppBar(
              title: const Text('Payment',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              centerTitle: true,
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Notifications()),
                    );
                  },
                ),
              ]),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: screenheight * 0.02),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: SingleCase_data.length == 0
                      ? Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xFFFFCF71),
                                  Color(0xFF2376DD),
                                ],
                              )),
                          padding: EdgeInsets.all(screenwidth / 20),
                          height: MediaQuery.of(context).size.height * 0.28,
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: _loading == true &&
                                  _SingleCaseIdController.text != ''
                              ? SpinKitThreeBounce(
                                  color: Color(0xFFFFCF71),
                                  size: 30.0,
                                )
                              : null,
                        )
                      : Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xFFFFCF71),
                                  Color(0xFF2376DD),
                                ],
                              )),
                          padding: EdgeInsets.all(screenwidth / 20),
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: SafeArea(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Row(children: [
                                      Text(
                                        'Case ID #' +
                                            SingleCase_data[0].name,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 14),
                                      ),
                                      Expanded(
                                        child: Text(
                                          SingleCase_data[0].casType,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 14,
                                          ),
                                        ),
                                      )
                                    ])),
                                SizedBox(height: screenheight * 0.01),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'Date: ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenheight * 0.02),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: new EdgeInsets.only(
                                            top: screenheight * 0.02),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            new Text(
                                              'Accused Persion: ' +
                                                  SingleCase_data[0]
                                                      .accusedPersonName,
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                                height: screenheight * 0.01),
                                            new Text(
                                              'Procecution Code: ' +
                                                  SingleCase_data[0]
                                                      .caseProcecution,
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                                height: screenheight * 0.01),
                                            new Text(
                                              'Seized Documents: ' +
                                                  SingleCase_data[0]
                                                      .seizedDocument,
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                                height: screenheight * 0.01),
                                            new Text(
                                              'Penalty Ammount: ' +
                                                  SingleCase_data[0]
                                                      .penaltyAmount
                                                      .toString() +
                                                  ' BDT',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.white,
                                              ),
                                            ),
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
                SizedBox(height: screenheight * 0.02),
                Container(
                  padding: new EdgeInsets.all(screenwidth / 10),
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
                        Text(
                          'Secure Payment With DMP',
                          textScaleFactor: 2,
                          style: TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.bold,
                              fontSize: 8),
                        ),
                        SizedBox(height: screenheight * 0.06),
                        TextFormField(
                          controller: _SingleCaseIdController,
                          onChanged: (String Value) async {
                            _loading = true;
                            var response = await SingleCaseData_service()
                                .getSingleCaseData(
                                    _SingleCaseIdController.text);

                            setState(() {
                              this.SingleCase_data = response;
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0, -5, 0, -5),
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF004D40)),
                                borderRadius: BorderRadius.circular(25)),
                            prefixIcon: Icon(Icons.perm_identity),
                            hintText: 'Enter Case ID',
                          ),
                        ),
                        SizedBox(height: screenheight * 0.05),
                        Container(
                            child: Text(
                          "Here Payment will be done using bkash, Nagad, Master Card and Visa Card.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
                        )),
                        SizedBox(height: screenheight * 0.05),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF004D40),
                          ),
                          child: FlatButton(
                              color: Color(0xFF004D40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              // onPressed: _printPdf,
                              onPressed: SingleCase_data.length == 0
                                  ? () {
                                      return null;
                                    }
                                  : () async {
                                      PrintData();
                                      // PaymentPost();

                                      // final doc = pw.Document();
                                      //
                                      // doc.addPage(
                                      //   pw.Page(
                                      //     pageFormat: PdfPageFormat.a4,
                                      //     build: (pw.Context context) {
                                      //       return pw.Container(
                                      //         child: pw.Column (
                                      //           crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      //             children: [
                                      //               pw.Text('Pay Slip',style: pw.TextStyle(fontSize: 20)),
                                      //               pw.Text('Case ID # \n' +  SingleCase_data[0].name , style: pw.TextStyle(fontSize: 25)),
                                      //               pw.Text('Case Type: ' + SingleCase_data[0].casType , style: pw.TextStyle(fontSize: 20)),
                                      //               pw.Text('Accused Persion: ' + SingleCase_data[0].accusedPersonName , style: pw.TextStyle(fontSize: 20)),
                                      //               pw.Text('Procecution Code: ' + SingleCase_data[0].caseProcecution, style: pw.TextStyle(fontSize: 20)),
                                      //               pw.Text('Seized Documents: '+ SingleCase_data[0].seizedDocument, style: pw.TextStyle(fontSize: 20)),
                                      //               pw.Text('Penalty Ammount: ' + SingleCase_data[0].penaltyAmount.toString() + ' BDT', style: pw.TextStyle(fontSize: 20)),
                                      //
                                      //             ]
                                      //         ),
                                      //
                                      //       );
                                      //     },
                                      //   ),
                                      // );
                                      // await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());
                                    },
                              child: Center(
                                child: Text(
                                  'Pay Now',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void PrintData() async {
    String? Message;
    final arguments = {
      'Case ID': SingleCase_data[0].name,
      'Accused Persion': SingleCase_data[0].accusedPersonName,
      'Procecution Code': SingleCase_data[0].caseProcecution,
      'Seized Documents': SingleCase_data[0].seizedDocument,
      'Penalty Ammount': SingleCase_data[0].penaltyAmount.toString(),
    };

    try {
      Message = await PrintChannel.invokeMethod("PrintData", arguments);
    } catch (e) {
      print(e);
    }

    print(Message);
  }
}
