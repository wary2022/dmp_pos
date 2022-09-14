import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import '../../Model/MiscellaneousReason_model.dart';
import '../../Model/Miscellaneous_Model.dart';
import '../../Service/MainService.dart';
import '../../Service/Miscellaneous_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../Service/Sharedpreferences_service.dart';
import '../../Structure/homepage.dart';

class Miscellaneous extends StatefulWidget {
  const Miscellaneous({Key? key}) : super(key: key);

  @override
  State<Miscellaneous> createState() => _MiscellaneousState();
}


class _MiscellaneousState extends State<Miscellaneous> {



  String not_validuser = "";
  String fileName = "";

  String reason = "";
  String WitnessBipId = "";

  int Miscellaneous_id=0;
  int MiscellaneousReason_id=0;



  List<Miscellaneous_Data> Miscellaneous_data=[];
  List<MiscellaneousReason_Data> MiscellaneousReason_data=[];
  void get_data() async{
    var Miscellaneous=await Miscellaneous_service().getMiscellaneous_Data();
    var MiscellaneousReason=await Miscellaneous_service().getMiscellaneousReason_Data();

    setState(() {
      this.Miscellaneous_data=Miscellaneous;
      this.MiscellaneousReason_data=MiscellaneousReason;
    });

  }

  void initState() {
    super.initState();
    this.get_data();
    DataCall();

  }

  void DataCall() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // this.miscellaneousType = prefs.getString('miscellaneousType').toString();
    setState(() {
    this.reason = prefs.getString('selectReason').toString();
    this.WitnessBipId = prefs.getString('witnessId').toString();});
  }


  String caseType = "";
  String caseUse = "";
  String caseAria = "";
  String regGroup = "";
  String vehicleNumber = "";
  String procecutionCode = "";
  String Documents = "";
  String persionName = "";
  String fatherName = "";
  String MobNumber = "";
  String persionAddress = "";
  String miscellaneousType = "";
  String Reason = "";
  String witnessId = "";
  String UploadFile = "";
  String license_number= "";
  String vehicle_engine_number="";
  String vehicle_chassis_number= "";
  String filename="";

  final String url = Url().url + "case_submit";
  final String token= Token().getToken();

  String state = "";

  List selectedData = [];
  List<String> TotalData = [];


  String? value;

  late TextEditingController controller;
  String name = '';
  String name2 = '';
  var res;



  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;

    DropdownMenuItem<String> buildMenuItem(MiscellaneousReason_Data item) => DropdownMenuItem(
          value: item.id.toString(),
          child: Text(
            item.name,
            style: TextStyle(fontSize: 18),
          ),
        );



    Future openDialog1() => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Success Message',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            content: Text(
                'Great. Your case has been successfully added.\n'
                // 'Case ID #14687461'
                ,
                style: TextStyle(
                  fontSize: 15,
                )),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(
                        builder: (_) => Homepage(),
                      ));

                    },
                    child: Text(
                      'Got it',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF004D40)),
                    )),
              ),
            ],
          ),
        );

    Future openDialog() => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Confermation Message',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            content: Text(
                'Are you sure to submit the case?\n\n'
                'Call Center: 12345',
                style: TextStyle(
                  fontSize: 15,
                )),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: ElevatedButton(
                    onPressed: () async {
                      EasyLoading.show(status: 'Uploading...');
                      final prefs = await SharedPreferences.getInstance();

                      this.filename = prefs.getString('filename').toString();
                      if(filename != 'null') {
                        res = await Miscellaneous_service().uploadImage(
                            filename, url);
                      } else{
                        res = await Miscellaneous_service().uploadData(
                            url);
                      }


                           if(res.statusCode == 200){
                             EasyLoading.dismiss();
                          SharedPreferences preferences = await SharedPreferences.getInstance();
                          await preferences.clear();
                          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                          sharedPreferences.setString("token", token);
                             EasyLoading.showSuccess('Great Success!');
                        openDialog1();

                        }else if(res.statusCode == 500){
                             EasyLoading.dismiss();
                             EasyLoading.showError('Server Error');
                        } else{
                             EasyLoading.dismiss();
                             EasyLoading.showError('Something went wrong..');
                        }

                      // }
                      // else{
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       behavior: SnackBarBehavior.floating,
                      //       content: Container(
                      //         padding: const EdgeInsets.all(16),
                      //         height: 90,
                      //         decoration: const BoxDecoration(
                      //           color: Colors.amberAccent,
                      //           borderRadius: BorderRadius.all(Radius.circular(20)),
                      //         ),
                      //         child: const Text("Something went wrong.."),
                      //       ),
                      //     )
                      //   );
                      // }
                      // _DataSend();

                      },
                    child: Text(
                      "I'm sure",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF004D40)),
                    )),
              ),
            ],
          ),
        );

    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFF1F1F1),
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15.0),
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
                                Color(0xFF0f0c29),
                                Color(0xFF302b63),
                                Color(0xFF24243e),
                              ],
                            )),
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Miscellaneous',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 24),
                                      ),
                                      Expanded(
                                        child: Image(
                                          image: AssetImage(
                                              'images/traffic_police.png'),
                                            height: screenheight*0.2, width: screenwidth*0.4,
                                        ),
                                      )
                                    ])),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(25),
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
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Miscellaneous',
                            textScaleFactor: 2,
                            style: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),

                          Padding(
                            padding: new EdgeInsets.only(top: screenheight*0.03),
                            child: Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: [
                                  Text(
                                    "Select The Reason",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: Colors.black12, width: 3)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value:reason==""? value:reason,
                                  iconSize: 55,
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Color(0xFF004D40),
                                  ),
                                  isExpanded: true,
                                  hint: Text('No Reason Selected'),
                                  items: MiscellaneousReason_data
                                      .map(buildMenuItem).toList(),

                                    onChanged: (value) {
                                      setState(() => this.value = value);

                                      String keyname;
                                      keyname= "selectReason";
                                      Sharedpreferences_service().keep_case_data_string(keyname, value);
                                    }
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: new EdgeInsets.only(top: screenheight*0.03),
                            child: TextFormField(
                                controller: TextEditingController(text: WitnessBipId),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey, width: 5),
                                    borderRadius: BorderRadius.circular(10)),
                                suffixIcon: Padding(
                                  padding: new EdgeInsets.only(right: screenwidth*0.03),
                                  child: Icon(
                                    Icons.qr_code_scanner,
                                    size: 30,
                                  ),
                                ),
                                hintText: 'Enter Witness BIP ID',
                              ),
                              onChanged: (text){
                                String keyname;
                                keyname= "witnessId";
                                Sharedpreferences_service().keep_case_data_string(keyname, text);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13.0),
                            child: Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Have any image or video\nas a reference?",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.grey),
                                    ),
                                  ),
                                  // SizedBox(width: MediaQuery.of(context).size.width / 3.5,),
                                  ElevatedButton(
                                      // onPressed: ()=>getImage(binary: false),
                                      onPressed: () async {
                                        // var file = await ImagePicker().pickImage(source: ImageSource.gallery);
                                        print("******************");

                                        FilePickerResult? result = await FilePicker.platform.pickFiles();

                                        if (result != null) {
                                          String FilePath = result.files.single.path.toString();
                                          File? file = File(FilePath);
                                          fileName = result.files[0].name;

                                          Sharedpreferences_service().keep_case_data_string("filename",file.path);
                                          setState((){
                                            fileName;
                                          });
                                        }
                                      },
                                      child: Text(
                                        'Upload File',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color(0xFF004D40)),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Container(
                              alignment: Alignment.center,
                              margin:
                                  EdgeInsets.only(left: screenwidth*0.03, right: screenwidth*0.03, top: screenheight*0.01),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.8,
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: Color(0xFF198754),
                                ),
                                child: Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: fileName == "" ?
                                          Text(
                                            "No File",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 16),
                                          ) : Text(
                                            fileName,
                                          style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                          )
                                        )
                                )
                              ),
                          Expanded(
                            child: Container(
                              child: GridView.count(
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                crossAxisCount: 2,
                                children: Miscellaneous_data.map((e) {
                                  return Padding(
                                    padding: new EdgeInsets.only(top: screenheight*0.001),
                                    child: Container(
                                      child: CheckboxListTile(
                                        contentPadding: EdgeInsets.all(0),
                                        title: Text(e.name, style: TextStyle(
                                            color: Colors.black54,
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
                                          keyname = "miscellaneousType";
                                          Sharedpreferences_service().keep_case_data_array(keyname, TotalData);
                                        },
                                        controlAffinity:
                                        ListTileControlAffinity.leading,
                                        activeColor: Color(0xFF004D40),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),

                            ),
                          ),
                          // Expanded(child: SizedBox(height: screenheight / 1)),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              openDialog();
            },
            label: Text("Submit"),
            icon: const Icon(Icons.done_all),
            backgroundColor: Color(0xFF004D40),
          ),
        )
      );
  }

  getImage({required bool binary}) {}
}
