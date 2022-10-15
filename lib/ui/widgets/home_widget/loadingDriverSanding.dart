import 'package:flutter/material.dart';
import 'package:formulahack/ui/widgets/shimmer_widget.dart';
import 'package:shimmer/shimmer.dart';

class LoadingDriverStanding extends StatefulWidget {
  const LoadingDriverStanding({Key? key}) : super(key: key);

  @override
  State<LoadingDriverStanding> createState() => _LoadingDriverStandingState();
}

class _LoadingDriverStandingState extends State<LoadingDriverStanding> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, right: 10),
      height: 125,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.5),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(7.5),
          child: ShimmerWidget(height: 125, width: 200)),
    );
  }
}
