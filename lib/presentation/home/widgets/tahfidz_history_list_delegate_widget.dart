import 'package:flutter/material.dart';
import 'package:hafizh/common/const/screen_padding_constant.dart';
import 'package:hafizh/common/ui/widget/molecules/card/surah_card_widget.dart';

class TahfidzhHistoryListDelegateWidget extends StatelessWidget {
  const TahfidzhHistoryListDelegateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 20, horizontal: ScreenPaddingConstant.horizontal),
      child: Column(
        children: [
          SurahCardWidget(
            subtitle: "Last Read at ayah 122",
            name: "Al-Fatiha",
            number: 1,
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
