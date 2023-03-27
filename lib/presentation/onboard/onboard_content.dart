import 'package:flutter/material.dart';
import 'package:hafizh/common/const/spacing_constant.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';

class OnBoardContent extends StatelessWidget {
  const OnBoardContent(
      {super.key,
      required String imagePath,
      required String title,
      required String description})
      : _imagePath = imagePath,
        _title = title,
        _description = description;

  final String _imagePath;
  final String _title;
  final String _description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(48.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(
                _imagePath,
              ),
              height: 300.0,
              width: 300.0,
            ),
          ),
          SizedBox(height: SpacingConstant.md),
          Text(
            _title,
            style: context.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: SpacingConstant.md),
          Text(
            _description,
            style: context.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
