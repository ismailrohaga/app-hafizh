import 'package:flutter/material.dart';
import 'package:hafizh/common/const/named_routes.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/common/ui/widget/organisms/appbar/scaffold_with_app_bar.dart';
import 'package:hafizh/presentation/detail_surah/bloc/detail_surah_bloc.dart';
import 'package:hafizh/presentation/detail_surah/bloc/detail_surah_event.dart';
import 'package:hafizh/presentation/detail_surah/bloc/detail_surah_state.dart';
import 'package:hafizh/presentation/detail_surah/widgets/list_verse_widget.dart';

class DetailSurahView extends StatefulWidget {
  final int number;
  const DetailSurahView({super.key, required this.number});

  @override
  State<DetailSurahView> createState() => _DetailSurahViewState();
}

class _DetailSurahViewState extends State<DetailSurahView> {
  @override
  void initState() {
    Future.microtask(() {
      _fetchDetailSurah();
    });

    super.initState();
  }

  _fetchDetailSurah() {
    context.read<DetailSurahBloc>().add(FetchDetailSurah(widget.number));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;

    return BlocConsumer<DetailSurahBloc, DetailSurahState>(
      listener: (context, state) {},
      builder: (context, state) {
        final status = state.statusSurahDetail.status;
        final surah = state.statusSurahDetail.data;
        final verses = surah?.verses;

        return OrganismScaffoldWithDetailSurahAppBar(
            loading: status.isLoading,
            surah: surah?.name.transliteration.id,
            verse: surah?.numberOfVerses,
            surahNumber: surah?.number,
            onBackPressed: () => context.goNamed(NamedRoutes.quranView),
            child: RefreshIndicator(
              onRefresh: () async {
                _fetchDetailSurah();
              },
              child: ListVerseWidget(
                  verses: verses,
                  status: status,
                  textTheme: textTheme,
                  colors: colors),
            ));
      },
    );
  }
}
