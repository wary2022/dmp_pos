import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../CaseEntry/InnerPage/documents.dart';
import '../CaseEntry/InnerPage/miscellaneous.dart';
import '../CaseEntry/InnerPage/personInformation.dart';
import '../CaseEntry/InnerPage/procecutionCode.dart';
import '../CaseEntry/engineInformation.dart';
import '../Pages/notifications.dart';

import '../CaseEntry/InnerPage/miscellaneous.dart';

class PageViewEngine extends StatefulWidget {
  const PageViewEngine({Key? key}) : super(key: key);

  @override
  State<PageViewEngine> createState() => _PageViewEngineState();
}

class _PageViewEngineState extends State<PageViewEngine> {
// class PageViewEngine extends StatelessWidget {

  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final PageController controller = PageController();
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      appBar: AppBar(
          title: const Text('Case Entry',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          backgroundColor: Color(0xFF004D40),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              EasyLoading.dismiss();
              Navigator.of(context).pop();
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              tooltip: 'Show Snackbar',
              onPressed: () {
                EasyLoading.dismiss();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notifications()),
                );
              },
            ),
          ]),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              children: const <Widget>[
                EngineInformation(),
                ProcecutionCode(),
                Documents(),
                PersionInformation(),
                Miscellaneous(),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF004D40),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 5),
              child: Row(
                children: [
                  FloatingActionButton.extended(
                    onPressed: () {
                      EasyLoading.dismiss();
                      controller.previousPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut);
                    },
                    label: Text(
                      'Back',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    backgroundColor: Color(0xFF004D40),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FloatingActionButton.extended(
                          onPressed: () => controller.nextPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut),
                          label: Row(
                            children: <Widget>[
                              Text(
                                "Next",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Icon(Icons.arrow_forward)
                            ],
                          ),
                          icon: Container(),
                          backgroundColor: Color(0xFF004D40),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
