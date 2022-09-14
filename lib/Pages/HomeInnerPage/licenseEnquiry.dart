import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'dart:io' as Io;
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../Model/LicenseInquery_model.dart';
import '../../Service/LicenseInquery_service.dart';
import '../notifications.dart';

class LicenseEnquiry extends StatefulWidget {
  const LicenseEnquiry({Key? key}) : super(key: key);

  @override
  State<LicenseEnquiry> createState() => _LicenseEnquiryState();
}

class _LicenseEnquiryState extends State<LicenseEnquiry> {
  String not_validuser = "";

  int Documents_id = 0;
  List<LicenseInquery> LicenseInquery_data = [];

  void initState() {
    super.initState();
  }

  final _licenseIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFF4f4f4f),
          appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  EasyLoading.dismiss();
                  Navigator.of(context).pop();
                },
              ),
              title: const Text('License Enquiry',
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
                Padding(
                  padding: new EdgeInsets.only(
                      top: screenheight * 0.02, bottom: screenheight * 0.02),
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xFFD16BA5),
                              Color(0xFF86A8E7),
                              Color(0xFF5FFBF1),
                            ],
                          )),
                      padding: EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.height / 7,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Row(children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _licenseIdController,
                                    autovalidateMode: AutovalidateMode.always,
                                    decoration: const InputDecoration(
                                      icon: Icon(Icons.edit),
                                      suffixIcon: Icon(Icons.qr_code_scanner),
                                      hintText: 'Enter License Number Here',
                                      labelText: 'License Number *',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: new EdgeInsets.only(
                                      left: screenwidth * 0.02,
                                      top: screenheight * 0.02),
                                  child: SizedBox(
                                    height: screenheight * 0.05,
                                    width: screenheight * 0.09,
                                    child: FlatButton(
                                      onPressed: () async {
                                        if (_licenseIdController.text != '') {
                                          EasyLoading.show(
                                              status: 'Searching...');
                                        }
                                        var response =
                                            await LicenseInquery_service()
                                                .getLicenseInquery_Data(
                                                    _licenseIdController.text);

                                        setState(() {
                                          this.LicenseInquery_data = response;
                                          EasyLoading.dismiss();
                                        });
                                      },
                                      child: Text(
                                        "GO",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      color: Color(0xFF004D40),
                                    ),
                                  ),
                                ),
                              ])),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: new EdgeInsets.all(screenwidth * 0.03),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(35),
                        topLeft: Radius.circular(35)),
                    color: Colors.white,
                  ),
                  height: screenheight,
                  width: screenwidth,
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          'Result',
                          textScaleFactor: 2,
                          style: TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.bold,
                              fontSize: 8),
                        ),
                        Padding(
                          padding:
                              new EdgeInsets.only(top: screenheight * 0.02),
                          child: LicenseInquery_data.length == 0
                              ? Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color(0xFF92DFF3),
                                          Color(0xFFFFCF71),
                                        ],
                                      )),
                                  height: screenheight * 0.5,
                                  width: screenwidth * 0.8,
                                  // child:  SpinKitThreeBounce(
                                  //   color: Color(0xFF3eb489),
                                  //   size: 30.0,
                                  // ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color(0xFF92DFF3),
                                          Color(0xFFFFCF71),
                                        ],
                                      )),
                                  child: Padding(
                                    padding: new EdgeInsets.only(
                                        top: screenheight * 0.02,
                                        right: screenheight * 0.02,
                                        left: screenheight * 0.02,
                                        bottom: screenheight * 0.02),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                radius: screenheight * 0.08,
                                                backgroundColor:
                                                    Color(0xFF004D40),
                                                backgroundImage: MemoryImage(
                                                    base64Decode(LicenseInquery_data[
                                                            0]
                                                        .ownerImage
                                                        .substring(
                                                            2,
                                                            LicenseInquery_data[
                                                                        0]
                                                                    .ownerImage
                                                                    .length -
                                                                1))),
                                              ),
                                              Padding(
                                                padding: new EdgeInsets.only(
                                                    top: screenheight * 0.01),
                                                child: Text(
                                                  "Image",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16),
                                                ),
                                              ),
                                              Padding(
                                                padding: new EdgeInsets.only(
                                                    top: screenheight * 0.02),
                                                child: Text(
                                                  "Bangladesh Road Transport Authority",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: new EdgeInsets.only(
                                              left: screenwidth * 0.2),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Name",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14),
                                              ),
                                              Padding(
                                                padding: new EdgeInsets.only(
                                                    top: screenheight * 0.01,
                                                    bottom:
                                                        screenheight * 0.02),
                                                child: Text(
                                                  LicenseInquery_data[0]
                                                      .ownerName,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                ),
                                              ),
                                              Text(
                                                "Date of Birth",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14),
                                              ),
                                              Padding(
                                                padding: new EdgeInsets.only(
                                                    top: screenheight * 0.01,
                                                    bottom:
                                                        screenheight * 0.02),
                                                child: Text(
                                                  LicenseInquery_data[0]
                                                      .ownerDob,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                ),
                                              ),
                                              Text(
                                                "Father Name",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14),
                                              ),
                                              Padding(
                                                padding: new EdgeInsets.only(
                                                    top: screenheight * 0.01,
                                                    bottom:
                                                        screenheight * 0.02),
                                                child: Text(
                                                  LicenseInquery_data[0]
                                                      .ownerFatherName,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                ),
                                              ),
                                              Text(
                                                "Issue Date",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14),
                                              ),
                                              Padding(
                                                padding: new EdgeInsets.only(
                                                    top: screenheight * 0.01,
                                                    bottom:
                                                        screenheight * 0.02),
                                                child: Text(
                                                  LicenseInquery_data[0]
                                                      .licenseIssueDate,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                ),
                                              ),
                                              Text(
                                                "Validity",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14),
                                              ),
                                              Padding(
                                                padding: new EdgeInsets.only(
                                                    top: screenheight * 0.01,
                                                    bottom:
                                                        screenheight * 0.02),
                                                child: Text(
                                                  LicenseInquery_data[0]
                                                      .licenseValidityDate,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                ),
                                              ),
                                              Text(
                                                "NID",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14),
                                              ),
                                              Padding(
                                                padding: new EdgeInsets.only(
                                                    top: screenheight * 0.01,
                                                    bottom:
                                                        screenheight * 0.02),
                                                child: Text(
                                                  LicenseInquery_data[0]
                                                      .ownerNid,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                        ),
                        // Padding(
                        //   padding: new EdgeInsets.only(top: screenheight*0.04),
                        //   child: Text( '',
                        //     LicenseInquery_data[0].ownerNid,
                        //     textScaleFactor: 2,
                        //     style: TextStyle(
                        //         color: Colors.black54,
                        //         fontWeight: FontWeight.bold,
                        //         fontSize: 12),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
