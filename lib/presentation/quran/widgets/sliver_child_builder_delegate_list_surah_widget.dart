import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/common/ui/widget/molecules/molecules.dart';
import 'package:hafizh/domain/entity/surah_entity.dart';

class SliverChildBuilderDelegateListSurahWidget extends StatelessWidget {
  final ViewData<List<SurahEntity>> state;
  final List<SurahEntity> surah;

  const SliverChildBuilderDelegateListSurahWidget(
      {super.key, required this.state, this.surah = const []});

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: delegate());
  }

  SliverChildBuilderDelegate delegate() {
    return SliverChildBuilderDelegate(childCount: surah.length, builder);
  }

  Widget? builder(BuildContext context, index) {
    final data = surah[index];

    final name = data.name.transliteration.id;
    final numberOfVerses = data.numberOfVerses;
    final number = data.number;

    final status = state.status;
    final message = state.message;

    if (status.isNoData) {
      return Center(
        child: Text(message.toString()),
      );
    }

    if (status.isError) {
      return Center(
        child: Text(message.toString()),
      );
    }

    if (status.isHasData) {
      return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: ScreenPaddingConstant.horizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: SpacingConstant.sm),
            SurahCardWidget(
              subtitle: "Number of Verses : $numberOfVerses",
              name: name,
              number: number,
              onTap: () => context.goNamed(NamedRoutes.detailSurahView,
                  params: {'id': number.toString()}),
            ),
          ],
        ),
      );
    }

    return Center(
      child: Text(
        "Error BLoC",
        style: context.textTheme.titleSmall?.copyWith(
          color: context.colors.primary,
        ),
      ),
    );
  }
}
