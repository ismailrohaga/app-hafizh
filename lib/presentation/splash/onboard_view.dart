import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hafizh/common/const/named_routes.dart';
import 'package:hafizh/common/const/screen_padding_constant.dart';
import 'package:hafizh/common/const/spacing_constant.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';

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
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 12.0,
      width: isActive ? 22.0 : 12.0,
      decoration: BoxDecoration(
        color: isActive ? context.colors.secondary : context.colors.tertiary,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                        imagePath: 'assets/images/image_onboard.png',
                        title: 'satu',
                        description: 'desc',
                      ),
                      OnBoardContent(
                        imagePath: 'assets/images/image_onboard.png',
                        title: 'dua',
                        description: 'desc',
                      ),
                      OnBoardContent(
                        imagePath: 'assets/images/image_onboard.png',
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
                const SizedBox(height: SpacingConstant.medium),
                OnBoardButton(
                  pageController: _pageController,
                  condition: _isLastPage,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//TODO: lift to atomic design
class OnBoardButton extends StatelessWidget {
  const OnBoardButton({
    super.key,
    required PageController pageController,
    required bool condition,
  })  : _pageController = pageController,
        _condition = condition;

  final PageController _pageController;
  final bool _condition;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: ScreenPaddingConstant.horizontal),
      child: ElevatedButton(
        onPressed: () {
          if (_condition) {
            //TODO: call preference provider markDoneOnBoard
            context.go(NamedRoutes.homeView);
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
          _condition ? 'Get Started' : 'Next',
          style: context.textTheme.titleMedium,
        ),
      ),
    );
  }
}

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
          const SizedBox(height: SpacingConstant.medium),
          Text(
            _title,
            style: context.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: SpacingConstant.medium),
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
