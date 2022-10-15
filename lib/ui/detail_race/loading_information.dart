import 'package:flutter/material.dart';
import 'package:formulahack/ui/widgets/shimmer_widget.dart';

class LoadingInformationRacePage extends StatelessWidget {
  const LoadingInformationRacePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        width: size.width,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShimmerWidget(height: 14, width: 60),
            const SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.center,
                child: ShimmerWidget(
                  height: size.width * 0.7,
                  width: size.width * 0.7,
                )),
            const SizedBox(
              height: 60,
            ),
            _timeRace(),
            const SizedBox(
              height: 15,
            ),
            _timeRace(),
            const SizedBox(
              height: 15,
            ),
            _timeRace(),
            const SizedBox(
              height: 15,
            ),
            _timeRace(),
            const SizedBox(
              height: 15,
            ),
            _timeRace(),
            const SizedBox(
              height: 15,
            ),
            _timeRace(),
          ],
        ),
      ),
    );
  }

  Widget _timeRace() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShimmerWidget(height: 16, width: 150),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            ShimmerWidget(height: 12, width: 130),
            SizedBox(height: 5),
            ShimmerWidget(height: 12, width: 100),
          ],
        ),
      ],
    );
  }
}
