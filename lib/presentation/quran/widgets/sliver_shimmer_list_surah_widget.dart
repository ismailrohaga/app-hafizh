import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';

class SliverShimmerListSurahWidget extends StatelessWidget {
  const SliverShimmerListSurahWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: 6,
            (context, index) => ShowUpAnimation(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: SpacingConstant.sm),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenPaddingConstant.horizontal),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          enabled: true,
                          child: Container(
                              width: double.infinity,
                              height: 110,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      CircularConstant.lg),
                                  color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                )));
  }
}
