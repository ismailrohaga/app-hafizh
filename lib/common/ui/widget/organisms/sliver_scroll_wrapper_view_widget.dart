import 'package:flutter/material.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';

class SliverScrollWrapperViewWidget extends StatelessWidget {
  final Widget background;
  final List<Widget> listDelegate;

  const SliverScrollWrapperViewWidget({
    super.key,
    required this.listDelegate,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        expandedHeight: 320,
        backgroundColor: context.colors.background,
        flexibleSpace: FlexibleSpaceBar(
          background: background,
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate(listDelegate),
      ),
    ]);
  }
}
