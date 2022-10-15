import 'package:flutter/material.dart';
import 'package:formulahack/common/color_values.dart';
import 'package:formulahack/ui/widgets/shimmer_widget.dart';

class LoadingNextRace extends StatefulWidget {
  const LoadingNextRace({Key? key}) : super(key: key);

  @override
  State<LoadingNextRace> createState() => _LoadingNextRaceState();
}

class _LoadingNextRaceState extends State<LoadingNextRace> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      height: 85,
      width: 155,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.5),
        color: ColorValues.secondColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7.5),
        child: ShimmerWidget(height: 85, width: 155),
      ),
    );
  }
}
