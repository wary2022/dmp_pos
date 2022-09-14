import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Model/AriaInfo_Model.dart';
import '../../Model/GroupReg_Model.dart';
import '../../Service/Sharedpreferences_service.dart';
import '../../Service/VehicleInfo_service.dart';


// File file = pickedFile as File;
// ByteData FileData = ByteData(file.readAsBytesSync().length);
// UploadedFile = FileData.toString();

class VehicleInformation extends StatefulWidget {
  const VehicleInformation({Key? key}) : super(key: key);

  @override
  State<VehicleInformation> createState() => _VehicleInformationState();
}

class _VehicleInformationState extends State<VehicleInformation> {

  String not_validuser = "";


  String caseAria = "";
  String regGroup = "";
  String vehicleNumber = "";

  void DataCall() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    this.caseAria = prefs.getString('CaseAria').toString();
    this.regGroup = prefs.getString('Reg_group').toString();
    this.vehicleNumber = prefs.getString('vehicle_number').toString();});

  }



  int AriaInfo_id=0;
  int GroupReg_id=0;

  List<GroupReg_Data> GroupReg_data=[];
  List<AriaInfo_Data> AriaInfo_data=[];
  void get_data() async{
    var GroupReg=await VehicleInfo_service().getGroupReg_Data();
    var AriaInfo=await VehicleInfo_service().getAriaInfo_Data();

    setState(() {
      this.GroupReg_data=GroupReg;
      this.AriaInfo_data=AriaInfo;
      DataCall();
    });

  }


  void initState() {
    super.initState();
    this.get_data();

    controller = TextEditingController();
  }


  String? value;
  String? value2;

  late TextEditingController controller;
  String name = '';
  String name2 = '';



  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;

    DropdownMenuItem<String> buildMenuItem(AriaInfo_Data item) => DropdownMenuItem(
          value: item.id.toString(),
          child: Text(
            item.name,
            style: TextStyle(fontSize: 18),
          ),
        );
    DropdownMenuItem<String> buildMenuItemGroup(GroupReg_Data item) => DropdownMenuItem(
      value: item.id.toString(),
      child: Text(
        item.name,
        style: TextStyle(fontSize: 18),
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
                                                'Provide\nVehicle\nInformation',
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
                            padding: new EdgeInsets.all(screenwidth*0.05),
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
                                    'Provide vehicle information',
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
                                      margin:
                                         new EdgeInsets.only(left: screenwidth*0.02, right: screenwidth*0.02),
                                      child:Text(
                                            "Select The Aria",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                              color: Colors.black12, width: 3)),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: caseAria==""? value:caseAria,
                                          iconSize: 55,
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Color(0xFF004D40),
                                          ),
                                          isExpanded: true,
                                          hint: Text('No Aria Selected'),
                                          items: AriaInfo_data
                                              .map(buildMenuItem)
                                              .toList(),
                                          onChanged: (value) {
                                            setState(() => this.value = value);

                                            String keyname;
                                            keyname = "CaseAria";
                                            Sharedpreferences_service().keep_case_data_string(keyname, value);
                                          }
                                        ),
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: new EdgeInsets.only(top: screenheight*0.03),
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      margin:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Select Registration Group",
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
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                              color: Colors.black12, width: 3)),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: regGroup==""? value2:regGroup,
                                          iconSize: 55,
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Color(0xFF004D40),
                                          ),
                                          isExpanded: true,
                                          hint: Text('No Group Selected'),
                                          items: GroupReg_data
                                              .map(buildMenuItemGroup)
                                              .toList(),
                                          onChanged: (value) {
                                            setState(() => this.value2 = value);

                                            String keyname;
                                            keyname= "Reg_group";
                                            Sharedpreferences_service().keep_case_data_string(keyname, value);
                                          }
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: new EdgeInsets.only(top: screenheight*0.03),
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      margin:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Provide Vehicle Number",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      TextFormField(
                                        controller: TextEditingController(text: vehicleNumber),
                                        decoration: InputDecoration(
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey, width: 5,),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10)),
                                          hintText: 'Enter Vehicle Number',
                                        ),

                                        onChanged: (text){
                                          String keyname;
                                          keyname= "vehicle_number";
                                          Sharedpreferences_service().keep_case_data_string(keyname, text);
                                        },
                                      )],
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
                )
    );
  }
}


