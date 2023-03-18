import 'package:flutter/material.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';

class AtomCircularPercentageIndicatorWidget extends StatefulWidget {
  final double value;
  final double? strokeWidth;
  final bool? immediateAnimate;

  const AtomCircularPercentageIndicatorWidget(
      {super.key,
      required this.value,
      this.strokeWidth,
      this.immediateAnimate = true});

  @override
  State<AtomCircularPercentageIndicatorWidget> createState() =>
      _AtomCircularPercentageWidgetState();
}

class _AtomCircularPercentageWidgetState
    extends State<AtomCircularPercentageIndicatorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    controller.addListener(() {
      setState(() {});
    });

    if (widget.immediateAnimate!) {
      controller.animateTo(
        widget.value,
        curve: Curves.easeInOut,
      );
    } else {
      controller.value = widget.value;
    }

    super.initState();
  }

  @override
  void didUpdateWidget(
      covariant AtomCircularPercentageIndicatorWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      controller.animateTo(
        widget.value,
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final value = controller.value;
    final percentageLabelValue = (controller.value * 100).toInt();

    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            child: Text(
          "$percentageLabelValue%",
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colors.secondary,
          ),
        )),
        SizedBox(
          width: 70,
          height: 70,
          child: CircularProgressIndicator(
            value: value,
            valueColor: AlwaysStoppedAnimation<Color>(context.colors.secondary),
            strokeWidth: widget.strokeWidth ?? 10,
            backgroundColor: context.colors.tertiary,
          ),
        ),
      ],
    );
  }
}
