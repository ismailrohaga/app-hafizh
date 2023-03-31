import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';

import 'package:hafizh/common/ui/widget/molecules/molecules.dart';
import 'package:hafizh/common/ui/widget/organisms/organisms.dart';

import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/presentation/bloc/auth/auth_bloc.dart';
import 'package:hafizh/presentation/home/widgets/sliver_tahfidz_history_card_widget.dart';
import 'package:hafizh/presentation/home/widgets/sliver_tahfidz_history_list_delegate_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state.status == AuthStatus.unauthenticated) {
        context.goNamed(NamedRoutes.loginView);
      }
    }, builder: (context, state) {
      return Scaffold(
        body: SliverScrollWrapperViewWidget(
          expandedHeight: 320,
          title: Text(
            'Hi ${state.user.name}',
            style: context.textTheme.titleLarge,
          ),
          background: DashboardWidget(
            backgroundImage: AssetConstant.heroBgImage,
            contractWidget: const DashboardFullContractWidget(),
            callToAction: HafizhButtonWidget(
              text: 'Start New Tahfidz',
              onTap: () {},
            ),
          ),
          slivers: const [
            SliverTahfidzHistoryCardWidget(),
            SliverTahfidzhHistoryListDelegateWidget()
          ],
        ),
      );
    });
  }
}
