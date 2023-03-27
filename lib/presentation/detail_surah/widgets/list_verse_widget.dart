import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/common/ui/app_colors.dart';
import 'package:hafizh/domain/entity/detail_surah_entity.dart';

class ListVerseWidget extends StatelessWidget {
  const ListVerseWidget({
    super.key,
    required this.verses,
    required this.status,
    required this.textTheme,
    required this.colors,
  });

  final List<VerseEntity>? verses;
  final ViewState status;
  final TextTheme textTheme;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) => SizedBox(
              height: SpacingConstant.md,
            ),
        itemCount: verses?.length ?? 0,
        itemBuilder: (context, index) {
          if (status.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final verse = verses![index];

          return VerseWidget(
              colors: colors, verse: verse, textTheme: textTheme);
        });
  }
}

class VerseWidget extends StatelessWidget {
  const VerseWidget({
    super.key,
    required this.colors,
    required this.verse,
    required this.textTheme,
  });

  final ColorScheme colors;
  final VerseEntity verse;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VerseToolbarWidget(colors: colors, verse: verse, textTheme: textTheme),
        SizedBox(
          height: SpacingConstant.md,
        ),
        VerseArabTextWidget(verse: verse, textTheme: textTheme),
        SizedBox(
          height: SpacingConstant.xl,
        ),
        VerseTransliterationTextWidget(verse: verse, textTheme: textTheme)
      ],
    );
  }
}

class VerseTransliterationTextWidget extends StatelessWidget {
  const VerseTransliterationTextWidget({
    super.key,
    required this.verse,
    required this.textTheme,
  });

  final VerseEntity verse;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShowUpAnimation(
          child: Text(
            verse.text.transliteration.en,
            textAlign: TextAlign.left,
            style: textTheme.labelMedium?.copyWith(
              color: AppColors.kLightDeepGreen,
              height: 1.5,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        SizedBox(
          height: SpacingConstant.xs,
        ),
        ShowUpAnimation(
          child: Text(
            verse.translation.id,
            textAlign: TextAlign.justify,
            style: textTheme.bodySmall?.copyWith(
              color: AppColors.kLightDeepGreen,
            ),
          ),
        )
      ],
    );
  }
}

class VerseArabTextWidget extends StatelessWidget {
  const VerseArabTextWidget({
    super.key,
    required this.verse,
    required this.textTheme,
  });

  final VerseEntity verse;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      delayStart: const Duration(milliseconds: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              verse.text.arab,
              textAlign: TextAlign.right,
              style: textTheme.headlineMedium?.copyWith(
                  color: AppColors.kLightDeepGreen,
                  fontWeight: FontWeight.w400,
                  height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class VerseToolbarWidget extends StatefulWidget {
  final AudioPlayer player = AudioPlayer();

  VerseToolbarWidget({
    super.key,
    required this.colors,
    required this.verse,
    required this.textTheme,
  });

  final ColorScheme colors;
  final VerseEntity verse;
  final TextTheme textTheme;

  @override
  State<VerseToolbarWidget> createState() => _VerseToolbarWidgetState();
}

class _VerseToolbarWidgetState extends State<VerseToolbarWidget> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> playAudioUrl() async {
    try {
      await widget.player.setAudioSource(
          AudioSource.uri(Uri.parse(widget.verse.audio.primary)));

      await widget.player.play();
    } catch (e) {
      context.scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();

    widget.player.stop();
    widget.player.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      widget.player.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: SpacingConstant.md, vertical: SpacingConstant.sm),
        decoration: BoxDecoration(
            color: widget.colors.tertiary.withOpacity(0.5),
            borderRadius: BorderRadius.circular(CircularConstant.lg)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: SpacingConstant.xl,
              height: SpacingConstant.xl,
              decoration: BoxDecoration(
                  color: widget.colors.secondary,
                  borderRadius: BorderRadius.circular(CircularConstant.xxl)),
              child: Center(
                child: Text(
                  widget.verse.number.inSurah.toString(),
                  style: widget.textTheme.labelMedium,
                ),
              ),
            ),
            StreamBuilder<PlayerState>(
                stream: widget.player.playerStateStream,
                builder: (context, snapshot) {
                  final playerState = snapshot.data;
                  final processingState = playerState?.processingState;
                  final playing = playerState?.playing;

                  if (processingState == ProcessingState.loading ||
                      processingState == ProcessingState.buffering) {
                    return SizedBox(
                      width: 18.0,
                      height: 18.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 3.0,
                        color: widget.colors.secondary,
                      ),
                    );
                  } else if (playing != true) {
                    return InkWell(
                        onTap: () async => await playAudioUrl(),
                        borderRadius: BorderRadius.circular(10.0),
                        child: Icon(
                          Icons.play_arrow,
                          size: 24.0,
                          color: widget.colors.secondary,
                        ));
                  } else if (processingState != ProcessingState.completed) {
                    return InkWell(
                      onTap: () {
                        widget.player.stop();
                        widget.player.seek(Duration.zero);
                      },
                      borderRadius: BorderRadius.circular(10.0),
                      child: Icon(
                        Icons.pause,
                        size: 24.0,
                        color: widget.colors.secondary,
                      ),
                    );
                  } else {
                    return InkWell(
                        onTap: () => widget.player.seek(Duration.zero),
                        borderRadius: BorderRadius.circular(10.0),
                        child: Icon(
                          Icons.replay,
                          size: 24.0,
                          color: widget.colors.secondary,
                        ));
                  }
                })
          ],
        ),
      ),
    );
  }
}
