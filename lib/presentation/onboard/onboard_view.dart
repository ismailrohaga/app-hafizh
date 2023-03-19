import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hafizh/common/const/asset_constant.dart';
import 'package:hafizh/common/const/circular_constant.dart';
import 'package:hafizh/common/const/named_routes.dart';
import 'package:hafizh/common/const/screen_padding_constant.dart';
import 'package:hafizh/common/const/spacing_constant.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';
import 'package:hafizh/presentation/onboard/onboard_content.dart';
import 'package:provider/provider.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool _isLastPage = false;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: SpacingConstant.sm),
      height: 12.0,
      width: isActive ? 22.0 : 12.0,
      decoration: BoxDecoration(
        color: isActive ? context.colors.secondary : context.colors.tertiary,
        borderRadius:
            const BorderRadius.all(Radius.circular(CircularConstant.lg)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferenceSettingsProvider>(
        builder: (context, prefSetProvider, _) {
      return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            decoration: BoxDecoration(
              color: context.colors.background,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 40.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: PageView(
                      physics: const ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                          _isLastPage = (_currentPage == _numPages - 1);
                        });
                      },
                      children: const <Widget>[
                        OnBoardContent(
                          imagePath: AssetConstant.onBoardImage,
                          title: 'satu',
                          description: 'desc',
                        ),
                        OnBoardContent(
                          imagePath: AssetConstant.onBoardImage,
                          title: 'dua',
                          description: 'desc',
                        ),
                        OnBoardContent(
                          imagePath: AssetConstant.onBoardImage,
                          title: 'tiga',
                          description: 'desc',
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  const SizedBox(height: SpacingConstant.md),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: ScreenPaddingConstant.horizontal),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_isLastPage) {
                          prefSetProvider.markDoneOnBoard();
                          context.goNamed(NamedRoutes.loginView);
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        _isLastPage ? 'Get Started' : 'Next',
                        style: context.textTheme.titleMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
