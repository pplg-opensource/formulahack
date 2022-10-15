import 'package:flutter/material.dart';
import 'package:formulahack/common/color_values.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: ColorValues.primaryColor,
                foregroundColor: Colors.white,
                radius: 50,
                child: ClipRRect(
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Formula 1 Fan",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text("Dark Mode",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                  Spacer(),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        print(isSwitched);
                      });
                    },
                    activeTrackColor: Color(0xFFF99D93),
                    activeColor: ColorValues.primaryColor,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "The app is using data from Egast API",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "http://ergast.com/mrd/",
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  )),
              Spacer(),
              Text("Version: 1.0.0",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600))
            ],
          ),
        ),
      ),
    );
  }
}
