import 'package:flutter/material.dart';
import 'package:formulahack/ui/widgets/shimmer_widget.dart';

class LoadingScheduleCard extends StatelessWidget {
  final bool isPast;

  const LoadingScheduleCard({Key? key, this.isPast = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {},
      child: Container(
        width: size.width,
        height: size.height * 0.085,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        // color: Colors.white,
        child: Row(
          children: [
            const ClipOval(
              child: ShimmerWidget(height: 45, width: 45),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ShimmerWidget(height: 11, width: 58),
                const SizedBox(height: 6),
                isPast
                    ? const ShimmerWidget(height: 15, width: 130)
                    : SizedBox(
                        width: size.width / 1.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            ShimmerWidget(height: 15, width: 130),
                            ShimmerWidget(height: 11, width: 60)
                          ],
                        ),
                      ),
                const SizedBox(
                  height: 5,
                ),
                const ShimmerWidget(height: 13, width: 200)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
