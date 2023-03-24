import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ui/widget/molecules/card/surah_card_widget.dart';

class SliverTahfidzhHistoryListDelegateWidget extends StatelessWidget {
  const SliverTahfidzhHistoryListDelegateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return ShowUpAnimation(
          direction: Direction.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: ScreenPaddingConstant.horizontal),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: SpacingConstant.sm,
              ),
              SurahCardWidget(
                subtitle: "Last Read at ayah 122",
                name: "Al-Fatiha",
                number: 1,
                onTap: () => {},
              ),
            ]),
          ),
        );
      }, childCount: 10),
    );
  }
}
