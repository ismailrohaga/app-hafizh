import 'package:flutter/material.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/ui/widget/molecules/appbar/surah_appbar_title.dart';

class ScaffoldWithDetailSurahAppBar extends StatelessWidget {
  final Widget child;
  final String surah;
  final int? verse;
  final int? surahNumber;

  final void Function()? onBackPressed;

  const ScaffoldWithDetailSurahAppBar(
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
          toolbarHeight: 80,
          title: SurahAppBarTitle(
            surah: surah,
            verse: verse,
            surahNumber: surahNumber,
          ),
          leading: BackButton(
            color: context.theme.colorScheme.onSecondary,
            onPressed: onBackPressed,
          )),
      body: child,
    );
  }
}
