import 'package:flutter/material.dart';

import '../Pages/previousHistory.dart';
import '../Pages/todayHistory.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
            body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25),
                      )
                  ),
                  pinned: true,
                  expandedHeight: 150,
                  collapsedHeight: 70,
                  backgroundColor: Color(0xFF004D40),

                  flexibleSpace: FlexibleSpaceBar(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: Text(
                        'History',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:  Colors.white,
                            fontSize: 25),
                      ),
                    ),
                    centerTitle: true,
                  ),
                  bottom: TabBar(
                      padding: EdgeInsets.only(bottom: 10, right: 10, left: 10),
                      indicator: BoxDecoration(
                          color: Color(0xFF3eb489),
                          borderRadius: BorderRadius.circular(25)),
                      tabs: [

                        Tab(
                            height: 40,
                            child: Text(
                              "Today's History",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 14),
                            )),
                        Tab(
                            height: 40,
                            child: Text(
                              'Previous History',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 14),
                            )),
                      ]),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
              child: TabBarView(children: [ TodayHistory(), PreviousHistory(),]),
            ),
          ),
        )
    ),
  );
}

