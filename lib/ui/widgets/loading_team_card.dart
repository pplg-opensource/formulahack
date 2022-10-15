import 'package:flutter/material.dart';
import 'package:formulahack/ui/team_detail/team_detail_tabbar.dart';
import 'package:formulahack/ui/widgets/shimmer_widget.dart';
import 'package:shimmer/shimmer.dart';

class LoadingTeamCard extends StatelessWidget {
  const LoadingTeamCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFF484848),
      highlightColor: const Color(0xFF5F5F5F),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            children: [
              const ShimmerWidget(height: 14, width: 14),
              const SizedBox(width: 9),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const ShimmerWidget(height: 32, width: 5),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ShimmerWidget(height: 16, width: 190),
                  SizedBox(height: 7),
                  ShimmerWidget(height: 12, width: 100)
                ],
              ),
              const Spacer(),
              const ShimmerWidget(height: 28, width: 28),
            ],
          ),
        ),
      ),
    );
  }
}
