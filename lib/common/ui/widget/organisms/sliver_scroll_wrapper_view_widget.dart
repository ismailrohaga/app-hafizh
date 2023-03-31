import 'package:flutter/material.dart';
import 'package:hafizh/common/const/screen_padding_constant.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';

class SliverScrollWrapperViewWidget extends StatelessWidget {
  final Widget background;
  final Widget? title;
  final double expandedHeight;
  final Future<void> Function()? onStretchTrigger;
  final List<Widget> slivers;

  const SliverScrollWrapperViewWidget({
    super.key,
    required this.expandedHeight,
    required this.background,
    this.title,
    this.onStretchTrigger,
    this.slivers = const [],
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SliverAppBar(
        expandedHeight: expandedHeight,
        stretch: true,
        pinned: true,
        onStretchTrigger: onStretchTrigger,
        backgroundColor: context.colors.background,
        title: title,
        titleSpacing: ScreenPaddingConstant.horizontal,
        centerTitle: false,
        flexibleSpace: FlexibleSpaceBar(
          background: background,
          stretchModes: const [
            StretchMode.fadeTitle,
            StretchMode.zoomBackground,
          ],
        ),
      ),
      ...slivers,
    ]);
  }
}
