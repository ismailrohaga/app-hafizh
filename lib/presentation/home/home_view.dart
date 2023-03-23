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
    final authBloc = context.select((AuthBloc bloc) => bloc);

    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.unauthenticated) {
            context.goNamed(NamedRoutes.loginView);
          }
        },
        child: Scaffold(
          body: SliverScrollWrapperViewWidget(
            expandedHeight: 320,
            title: Text(
              'Hi ${authBloc.state.user.name}',
              style: context.textTheme.titleLarge,
            ),
            background: const DashboardWidget(
              backgroundImage: AssetConstant.heroBgImage,
              contractWidget: DashboardFullContractWidget(),
              callToAction: HafizhButtonWidget(
                text: 'Start New Tahfidz',
              ),
            ),
            slivers: const [
              SliverTahfidzHistoryCardWidget(),
              SliverTahfidzhHistoryListDelegateWidget()
            ],
          ),
        ));
  }
}
