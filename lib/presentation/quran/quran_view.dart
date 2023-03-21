import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafizh/common/const/screen_padding_constant.dart';
import 'package:hafizh/common/const/spacing_constant.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/presentation/quran/bloc/bloc.dart';
import 'package:hafizh/presentation/quran/widgets/expanded_search_bar_widget.dart';
import 'package:hafizh/presentation/quran/widgets/list_view_surah_widget.dart';

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
      final quranBloc = context.read<QuranBloc>();
      final isInitialFetchSurah = quranBloc.state.statusSurah.status.isInitial;

      if (isInitialFetchSurah) {
        quranBloc.add(FetchSurah());
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: ScreenPaddingConstant.horizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpandedSearchBarWidget(
                value: context.read<QuranBloc>().state.query,
                onSearch: (value) {
                  context.read<QuranBloc>().add(FilterSurah(query: value));
                },
              ),
              const SizedBox(height: SpacingConstant.md),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    context.read<QuranBloc>().add(FetchSurah());
                  },
                  child: BlocBuilder<QuranBloc, QuranState>(
                    builder: (context, state) {
                      final status = state.statusSurah.status;
                      final message = state.statusSurah.message;
                      // Check Status
                      if (status.isLoading || status.isInitial) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (status.isNoData) {
                        return Center(
                          child: Text(message.toString()),
                        );
                      }

                      if (status.isError) {
                        return Center(
                          child: Text(message.toString()),
                        );
                      }

                      if (status.isHasData) {
                        final surah = state.filteredSurah;

                        return ListViewSurahWidget(
                          surah: surah,
                        );
                      }

                      return Center(
                        child: Text(
                          "Error BLoC",
                          style: context.textTheme.titleSmall?.copyWith(
                            color: context.colors.primary,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
