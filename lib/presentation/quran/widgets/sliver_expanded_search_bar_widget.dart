import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';

class SliverExpandedSearchBarWidget extends StatefulWidget {
  final void Function(String value)? onSearch;
  final void Function(String? value)? onCategoryChanged;
  final String? value;
  final String? category;
  final bool isDarkTheme;

  const SliverExpandedSearchBarWidget(
      {super.key,
      this.onSearch,
      this.onCategoryChanged,
      this.category = "surah",
      this.value,
      this.isDarkTheme = false});

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
                : SearchDropdownCategory(
                    textTheme: textTheme,
                    isDarkTheme: isDarkTheme,
                    value: widget.category,
                    onChanged: widget.onCategoryChanged),

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

class SearchDropdownCategory extends StatelessWidget {
  const SearchDropdownCategory({
    super.key,
    this.value = "surah",
    this.onChanged,
    required this.textTheme,
    required this.isDarkTheme,
  });

  final TextTheme textTheme;
  final bool isDarkTheme;
  final String? value;
  final void Function(String? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      icon: const Icon(Icons.arrow_drop_down),
      value: value.toString(),
      isDense: true,
      borderRadius: BorderRadius.circular(CircularConstant.lg),
      dropdownColor: isDarkTheme ? Colors.grey[900] : Colors.white,
      style: context.textTheme.titleLarge
          ?.copyWith(color: isDarkTheme ? Colors.grey[300] : Colors.black),
      underline: Container(
        height: 2,
        color: Colors.transparent,
      ),
      onChanged: onChanged,
      items: const [
        DropdownMenuItem<String>(
          value: "surah",
          child: Text("Surah"),
        ),
        DropdownMenuItem<String>(
          value: "juz",
          child: Text("Juz"),
        )
      ],
    );
  }
}
