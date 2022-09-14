import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Structure/history.dart';
import '../CaseEntry/caseEntry.dart';
import '../Pages/HomeMain.dart';
import '../Pages/login.dart';
import '../Pages/payment.dart';
import '../Pages/profile.dart';


void main() { runApp(Myapp());}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      builder: EasyLoading.init(),
    );
  }
}

class Homepage extends StatefulWidget {

  @override
  _HomepageState createState() => _HomepageState();
}

  class _HomepageState extends State<Homepage> {

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Login()), (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Color(0xFF004D40),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.home_outlined, size: 25,),
            ), backgroundColor: Colors.white,
            label: 'Home',),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.history, size: 25,),
            ),
            backgroundColor: Color(0xFF004D40),
            label: 'History',),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.add_circle_rounded, size: 25,),
            ),
            backgroundColor: Color(0xFF004D40),
            label: 'Case Entry',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.account_balance_wallet_outlined, size: 25,),
            ),
            backgroundColor: Color(0xFF004D40),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.account_box_outlined, size: 25,),
            ),
            backgroundColor: Color(0xFF004D40),
            label: 'Profile',
          ),
        ],
        activeColor: Colors.white,
        inactiveColor: Colors.white54,
      ), tabBuilder: (BuildContext context, int index) {
      switch(index){
        case 0:
          return CupertinoTabView(builder: (context){
            return CupertinoPageScaffold(child: HomeMain(),);
          });
        case 1:
          return CupertinoTabView(builder: (context){
            return CupertinoPageScaffold(child: History(),);
          });
        case 2:
          return CupertinoTabView(builder: (context){
            return CupertinoPageScaffold(child: CaseEntry(),);
          });
        case 3:
          return CupertinoTabView(builder: (context){
            return CupertinoPageScaffold(child: Payment(ID: '',));
          });
        case 4:
          return CupertinoTabView(builder: (context){
            return CupertinoPageScaffold(child: Profile());
          });
        default: return CupertinoTabView(builder: (context){
          return CupertinoPageScaffold(child: HomeMain(),);
        });

      }
    },
    );
  }
}