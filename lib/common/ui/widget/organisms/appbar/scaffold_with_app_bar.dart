import 'package:flutter/material.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/ui/widget/molecules/appbar/surah_appbar_title_widget.dart';

class OrganismScaffoldWithDetailSurahAppBar extends StatelessWidget {
  final Widget child;
  final String surah;
  final int? verse;
  final int? surahNumber;

  final void Function()? onBackPressed;

  const OrganismScaffoldWithDetailSurahAppBar(
      {super.key,
      required this.child,
      required this.surah,
      this.verse,
      this.onBackPressed,
      this.surahNumber = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: context.colors.background,
          toolbarHeight: 90,
          title: MoleculeSurahAppBarTitleWidget(
            surah: surah,
            verse: verse,
            surahNumber: surahNumber,
          ),
          leading: BackButton(
            color: context.colors.surface,
            onPressed: onBackPressed,
          )),
      body: child,
    );
  }
}
