import 'package:flutter/material.dart';
import 'package:formulahack/ui/detail_race/result/qualify_result.dart';
import 'package:formulahack/ui/detail_race/result/race_result.dart';
import 'package:formulahack/ui/detail_race/result/sprint_result.dart';

import '../../common/color_values.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String title = "Race";
  int page = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    switch (page) {
      case 1:
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _dialog(title),
            ],
          ),
        );
      case 2:
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _dialog(title),
            ],
          ),
        );
      case 3:
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _dialog(title),
            ],
          ),
        );
      default:
        return Container(
          child: const Center(
            child: Text("Error"),
          ),
        );
    }
  }

  Widget _dialog(String title) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: InkWell(
        onTap: () {
          showDialog(context: context, builder: (context) => _raceTypeDialog());
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w600,
              ),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }

  Widget _raceTypeDialog() {
    return Dialog(
      backgroundColor: ColorValues.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: 300,
        height: 300,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Race types",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                int value = 1;

                if (value != page) {
                  setState(() {
                    title = "Race";
                    page = value;
                  });
                  if (!mounted) return;
                  Navigator.pop(context);
                } else {
                  Navigator.of(context).pop(false);
                }
              },
              child: Container(
                width: double.infinity,
                child: const Text(
                  "Race",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                int value = 2;

                if (value != page) {
                  setState(() {
                    title = "Qualification";
                    page = value;
                  });
                  if (!mounted) return;
                  Navigator.pop(context);
                } else {
                  Navigator.of(context).pop(false);
                }
              },
              child: Container(
                width: double.infinity,
                child: const Text(
                  "Qualification",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                int value = 3;

                if (value != page) {
                  setState(() {
                    title = "Sprint";
                    page = value;
                  });
                  if (!mounted) return;
                  Navigator.pop(context);
                } else {
                  Navigator.of(context).pop(false);
                }
              },
              child: Container(
                width: double.infinity,
                child: const Text(
                  "Sprint",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
