
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/services.dart';
import 'Pages/login.dart';
import 'Pages/profile.dart';
import 'Structure/homepage.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    builder: EasyLoading.init(),
    routes: {
      '/': (context) =>  Login(),
      // '/so_details':(context) =>  Account(),
      "/home" : (context) => Homepage(),
      "/profile":(context)=>Profile(),
    },
  ));
}
// class Myapp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: '/',
//       debugShowCheckedModeBanner: false,
//       // home: Homepage(),
//       routes: {
//         '/': (context) =>  Homepage(),
//         // "/home" : (context) => Home(),
//       },
//     );
//   }
// }

// class Homepage extends StatefulWidget {
//   @override
//   _HomepageState createState() => _HomepageState();
// }
//
// class _HomepageState extends State<Homepage> {
//   var _currentindex=0;
//
//   final pages= [
//     Home(),
//     Contacts(),
//     Notifications(),
//     Account()
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//
//     return SafeArea(
//       child: Scaffold(
//           bottomNavigationBar: BottomNavigationBar(
//               currentIndex: _currentindex,
//             items: const <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home,),
//                 backgroundColor: Color(0xFF3eb489),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.contact_page,),
//                 backgroundColor: Color(0xFF3eb489),
//                 label: 'Contact',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.notifications,),
//                 backgroundColor: Color(0xFF3eb489),
//                 label: 'Notification',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.account_box,),
//                 backgroundColor: Color(0xFF3eb489),
//                 label: 'Account',
//               ),
//             ],
//               onTap: (index){
//                 setState(() {
//                   _currentindex=index;
//                 });
//                 },
//           ),
//           body: pages[_currentindex]),
//     );
//   }
// }
