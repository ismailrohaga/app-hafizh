import 'package:flutter/material.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/ui/widget/molecules/molecules.dart';

class ScaffoldWithDetailSurahAppBar extends StatelessWidget {
  final Widget child;
  final SurahAppBarTitleWidget? title;

  final void Function()? onBackPressed;

  const ScaffoldWithDetailSurahAppBar(
      {super.key,
      required this.child,
      required this.title,
      this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: context.colors.background,
          toolbarHeight: 90,
          title: title,
          centerTitle: true,
          leading: BackButton(
            color: context.colors.surface,
            onPressed: onBackPressed,
          )),
      body: child,
    );
  }
}
