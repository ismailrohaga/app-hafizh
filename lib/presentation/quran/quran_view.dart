import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hafizh/common/const/named_routes.dart';
import 'package:hafizh/common/const/screen_padding_constant.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/common/ui/widget/molecules/card/surah_card_widget.dart';
import 'package:hafizh/presentation/quran/bloc/bloc.dart';

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
      final bloc = context.read<QuranBloc>();
      final isInitialFetchSurah = bloc.state.statusSurah.status.isInitial;

      if (isInitialFetchSurah) {
        bloc.add(FetchSurah());
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
                  final surah = state.statusSurah.data ?? [];

                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: surah.length,
                    itemBuilder: (context, index) => MoleculeSurahCardWidget(
                      subtitle:
                          "Number of Verses : ${surah[index].numberOfVerses}",
                      name: surah[index].name.transliteration.id,
                      number: surah[index].number,
                      onTap: () => context.goNamed(NamedRoutes.detailSurahView),
                    ),
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
      ),
    );
  }
}
