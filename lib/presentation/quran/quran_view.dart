import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/common/ui/widget/molecules/molecules.dart';
import 'package:hafizh/common/ui/widget/organisms/organisms.dart';
import 'package:hafizh/presentation/bloc/auth/auth_bloc.dart';

import 'package:hafizh/presentation/quran/bloc/bloc.dart';
import 'package:hafizh/presentation/quran/widgets/sliver_child_builder_delegate_list_surah_widget.dart';
import 'package:hafizh/presentation/quran/widgets/sliver_expanded_search_bar_widget.dart';
import 'package:hafizh/presentation/quran/widgets/sliver_shimmer_list_surah_widget.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      _fetchSurah();
    });
  }

  _fetchSurah({bool? forceRefresh}) {
    context.read<QuranBloc>().add(FetchSurah(forceRefresh: forceRefresh));
  }

  _onSearch(String value) {
    context.read<QuranBloc>().add(FilterSurah(query: value));
  }

  Future<void> _onRefresh() async {
    _fetchSurah(forceRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = context.select((AuthBloc bloc) => bloc);
    final prefs = context.read<PreferenceSettingsProvider>();

    return Scaffold(
      body: BlocBuilder<QuranBloc, QuranState>(
        builder: (context, state) {
          final loading = state.statusSurah.status.isLoading;
          final query = state.query;

          return SliverScrollWrapperViewWidget(
            expandedHeight: 240,
            title: Text(
              'Hi ${authBloc.state.user.name}',
              style: context.textTheme.titleLarge,
            ),
            onStretchTrigger: _onRefresh,
            background: DashboardWidget(
              backgroundImage: AssetConstant.heroBgImage,
              contractWidget: const DashboardSurahContractWidget(),
              callToAction: HafizhButtonWidget(
                text: 'Continue Reading',
                onTap: () {
                  // ignore: todo
                  // TODO: implement continue reading
                },
              ),
            ),
            slivers: [
              SliverExpandedSearchBarWidget(
                isDarkTheme: prefs.isDarkTheme,
                onSearch: _onSearch,
                value: query,
              ),
              if (loading)
                const SliverShimmerListSurahWidget()
              else
                SliverChildBuilderDelegateListSurahWidget(
                  state: state.statusSurah,
                  surah: state.filteredSurah,
                )
            ],
          );
        },
      ),
    );
  }
}
