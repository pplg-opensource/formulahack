import 'package:flutter/material.dart';
import 'package:formulahack/ui/widgets/driver_widget/alert_dialog.dart';
import 'package:formulahack/ui/widgets/driver_widget/result_card.dart';

class ResultDriver extends StatefulWidget {
  const ResultDriver({Key? key}) : super(key: key);

  @override
  State<ResultDriver> createState() => _ResultDriverState();
}

class _ResultDriverState extends State<ResultDriver> {
  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        height: heightScreen,
        width: widthScreen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => CustomAlert());
              },
              child: Container(
                child: Row(
                  children: [
                    Text("Current Season ",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w800)),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return ResultCard(number: (index + 1));
                    }))
          ],
        ),
      ),
    ));
  }
}
