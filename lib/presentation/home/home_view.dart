import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';

import 'package:hafizh/common/ui/widget/molecules/molecules.dart';
import 'package:hafizh/common/ui/widget/organisms/organisms.dart';

import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/presentation/bloc/auth/auth_bloc.dart';

import 'package:hafizh/presentation/home/widgets/tahfidz_history_card_widget.dart';
import 'package:hafizh/presentation/home/widgets/tahfidz_history_list_delegate_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.unauthenticated) {
            context.goNamed(NamedRoutes.loginView);
          }
        },
        child: const Scaffold(
          body: SliverScrollWrapperViewWidget(
            background: DashboardWidget(
              backgroundImage: AssetConstant.heroBgImage,
              callToAction: HafizhButtonWidget(
                text: 'Start New Tahfidz',
              ),
            ),
            listDelegate: [
              TahfidzHistoryCardWidget(),
              TahfidzhHistoryListDelegateWidget()
            ],
          ),
        ));
  }
}
