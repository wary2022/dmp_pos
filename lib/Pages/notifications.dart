import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;


    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFABF7B1),
          appBar: AppBar(
              backgroundColor: Color(0xFF004D40),
              actions: <Widget>[
                Padding(
                  padding: new EdgeInsets.only(right: screenwidth*0.09),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(0xFFABF7B1),
                    child: ClipOval(
                      child: Image.network(
                          'https://upstdc.co.in/AgentImage/default.jpg',
                          height: 30,
                          width: 30),
                    ),
                  ),
                ),
              ]),
              body: SafeArea(

                child: Column(
                  children: [
                    Padding(
                      padding: new EdgeInsets.only(top: screenheight*0.02, bottom: screenwidth*0.03, left: screenwidth*0.03),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text('Notifications',
                          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Color(0xFF004D40))),
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: new EdgeInsets.only(left: screenwidth*0.03),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30)),
                            color: Colors.white70,
                          ),
                          child: ListView.builder(itemCount:20, padding: new EdgeInsets.only(top: screenheight*0.03, left: screenwidth*0.04),itemBuilder: (context, index) =>
                              Padding(
                                padding: new EdgeInsets.all(screenwidth*0.001),
                                child: Card(
                                  child: ListTile(
                                    title: Text("Notification title goes here", style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),),
                                    subtitle: Text("Lorem ipsum dolor sit amet, consectetur.."),
                                    leading:CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Color(0xFF444446),
                                      child: ClipOval(
                                        child: Image.network(
                                            'https://upstdc.co.in/AgentImage/default.jpg',
                                            height: screenheight*0.1,
                                            width: screenwidth*0.1),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ),
                      ),
                    ),
                  ],
                )

              )


    ),
    );
  }
}
