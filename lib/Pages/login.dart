import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Model/login_model.dart';
import '../Service/MainService.dart';
import '../Service/login_service.dart';
import '../Structure/homepage.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    ));

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();

  message(String s) {

  }
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // final  _prefs = SharedPreferences.getInstance();
  int login_id = 0;
  List<LogIn_Data> logIn_data = [];

  void get_data() async {
    var userData = await LogIn_service().getLogIn_Data();

    setState(() {
      this.logIn_data = userData;
    });
  }

  void initState() {
    super.initState();
  }

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();






    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFF004D40),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            SizedBox(height: screenheight * 0.04),
                            CircleAvatar(
                                radius: screenheight * 0.08,
                                backgroundColor: Color(0xFF004D40),
                                child: ClipOval(
                                  child: Image(
                                    image: AssetImage(
                                        'images/dmp.png'), height: screenheight / 3, width: screenwidth / 3,),
                                )),
                            SizedBox(height: screenheight * 0.02),
                            Text(
                              "Dhaka Metropolitan Police",
                              textScaleFactor: 2,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            SizedBox(height: screenheight * 0.01),
                          ],
                        ),
                        height: screenheight * 0.3,
                        width: screenwidth / 0,
                      ),
                      Container(
                        padding: new EdgeInsets.all(screenwidth * 0.1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(35),
                              topLeft: Radius.circular(35)),
                          color: Colors.white,
                        ),
                        height: screenheight,
                        width: screenwidth,
                        child: Center(
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Text(
                                  'Please sign in to continue',
                                  textScaleFactor: 2,
                                  style: TextStyle(
                                      color: Colors.black26,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8),
                                ),
                                SizedBox(height: screenheight * 0.05),
                                TextFormField(
                                  controller: _usernameController,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(0, -5, 0, -5),
                                    labelStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF004D40)),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    prefixIcon: Icon(Icons.key),
                                    hintText: 'Enter BP ID',
                                  ),
                                  // validator: (value) {
                                  //   if (value!.isEmpty ||
                                  //       !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  //           .hasMatch(value!)) {
                                  //     return "Enter Correct BP ID";
                                  //   } else {
                                  //     return null;
                                  //   }
                                  // },
                                ),
                                SizedBox(height: screenheight * 0.03),
                                TextFormField(
                                  obscureText: true,
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(0, -5, 0, -5),
                                    labelStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF004D40)),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    prefixIcon: Icon(Icons.lock),
                                    hintText: 'Enter password',
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r"(?=.*[a-z])")
                                            .hasMatch(value!)) {
                                      return "Enter Correct password";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(height: screenheight * 0.04),
                                Container(
                                    child: Text(
                                  "By Pressing login button, you are agree to the terms & conditions of BP",
                                  textAlign: TextAlign.center,
                                )),
                                SizedBox(height: screenheight * 0.03),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Forget Password?',
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 15),
                                    )),
                                SizedBox(height: screenheight * 0.05),
                                Container(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: screenheight * 0.07,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFF004D40),
                                    ),
                                    child: FlatButton(
                                        color: Color(0xFF004D40),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        onPressed: () async {
                                          if (formKey.currentState!
                                              .validate()) {
                                            signIn(_usernameController.text,
                                                _passwordController.text);
                                          }
                                          ;
                                        },
                                        child: Center(
                                          child: Text(
                                            'Sign In',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        )),
                                  ),
                                ),
                                Expanded(child: SizedBox(height: screenheight)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          )),
    );
  }

  void _message(String messange) async {
    final snackBar = SnackBar(
        content: Text(
          messange,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  signIn(String name, String password) async {
    var jsonData = null;
    SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    try {
      var response = await http
          .get(Uri.parse(Url().url +
          "api/auth/token?db=" +
          DB().db +
          "&login=${name}&password=${password}"))
          .timeout(Duration(seconds: 3));
      switch (response.statusCode) {
        case 200:
          jsonData = json.decode(response.body);
          setState(() {
            SaveData().setId(jsonData['uid']);
            Token().setToken(jsonData['access_token']);

            sharedPreferences.setString("token", jsonData['access_token']);

            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => Homepage()),
                    (Route<dynamic> route) => false);
          });
          break;
        case 401:
          return _message('Incorrect BP ID or Password');
        default:
          throw Exception(response.reasonPhrase);
      }
    } on TimeoutException catch (_) {
      _message('Server Error. Try again later.');
    } on SocketException catch (_) {
      _message('No Internet Connection');
    } catch (e) {
      _message('Something Wrong. Try again later');
    }
  }
}
