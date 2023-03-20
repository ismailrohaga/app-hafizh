import 'package:flutter/material.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';

class ExpandedSearchBarWidget extends StatefulWidget {
  final void Function(String)? onSearch;
  final String? value;

  const ExpandedSearchBarWidget({super.key, this.onSearch, this.value});

  @override
  State<ExpandedSearchBarWidget> createState() => _ExpandedSearchBarWidget();
}

class _ExpandedSearchBarWidget extends State<ExpandedSearchBarWidget> {
  bool _isExpanded = false;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.value != null) {
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
    var textTheme = context.textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _isExpanded
            ? const SizedBox.shrink()
            : Text(
                "Quran",
                style: textTheme.titleLarge?.copyWith(color: Colors.black),
              ),

        _isExpanded
            ? Expanded(
                child: TextField(
                  controller: _controller,
                  style: textTheme.bodyLarge?.copyWith(color: Colors.black),
                  decoration: InputDecoration(
                      hintText: "Search Surah",
                      fillColor: Colors.transparent,
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      hintStyle:
                          textTheme.bodyLarge?.copyWith(color: Colors.black),
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
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: _onPressedStart,
              ),
      ],
    );
  }
}
