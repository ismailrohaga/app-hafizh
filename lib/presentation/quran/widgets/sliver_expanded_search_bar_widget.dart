import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';

class SliverExpandedSearchBarWidget extends StatefulWidget {
  final void Function(String)? onSearch;
  final String? value;
  final bool isDarkTheme;

  const SliverExpandedSearchBarWidget(
      {super.key, this.onSearch, this.value, this.isDarkTheme = false});

  @override
  State<SliverExpandedSearchBarWidget> createState() =>
      _SliverExpandedSearchBarWidget();
}

class _SliverExpandedSearchBarWidget
    extends State<SliverExpandedSearchBarWidget> {
  bool _isExpanded = false;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.value != null && widget.value!.isNotEmpty) {
      _isExpanded = true;
    }

    _controller.text = widget.value ?? "";

    _controller.addListener(() {
      if (widget.onSearch != null) {
        widget.onSearch!(_controller.text);
      }
    });
  }

  _onPressedStart() {
    setState(() {
      _isExpanded = true;
    });
  }

  _onPressedEnd() {
    _controller.clear();
    setState(() {
      _isExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final isDarkTheme = widget.isDarkTheme;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: SpacingConstant.sm,
            horizontal: ScreenPaddingConstant.horizontal),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _isExpanded
                ? const SizedBox.shrink()
                : Text(
                    "Surah",
                    style: textTheme.titleLarge?.copyWith(
                      color: isDarkTheme ? Colors.grey[300] : Colors.black,
                    ),
                  ),

            _isExpanded
                ? Expanded(
                    child: TextField(
                      controller: _controller,
                      autofocus: true,
                      style: textTheme.bodyLarge?.copyWith(
                          color: isDarkTheme ? Colors.grey[300] : Colors.black),
                      decoration: InputDecoration(
                          hintText: "Search Surah",
                          prefixIcon: const Icon(
                            Icons.search,
                          ),
                          suffixIcon: IconButton(
                            splashRadius: 20,
                            onPressed: _onPressedEnd,
                            icon: const Icon(Icons.clear),
                          )),
                    ),
                  )
                : const SizedBox.shrink(),

            // Search Icon
            _isExpanded
                ? const SizedBox.shrink()
                : IconButton(
                    splashRadius: 20,
                    icon: Icon(
                      Icons.search,
                      color: isDarkTheme ? Colors.grey[300] : Colors.black,
                    ),
                    onPressed: _onPressedStart,
                  ),
          ],
        ),
      ),
    );
  }
}
