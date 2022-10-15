import 'package:flutter/material.dart';
import 'package:formulahack/ui/widgets/shimmer_widget.dart';

class LoadingDriverCard extends StatelessWidget {
  const LoadingDriverCard({super.key});

  @override
  Widget build(BuildContext context) {
    var heightSize = MediaQuery.of(context).size.height;
    var widthSize = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 45,
        width: widthSize,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const ShimmerWidget(height: 14, width: 14),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: ShimmerWidget(height: 45, width: 45)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    ShimmerWidget(height: 16, width: 150),
                    SizedBox(height: 4),
                    ShimmerWidget(height: 12, width: 90)
                  ],
                ),
              ],
            ),
            const ShimmerWidget(height: 15, width: 60)
          ],
        ),
      ),
    );
  }
}
