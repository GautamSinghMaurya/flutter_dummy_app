import 'package:demo_flutter_app/architecture/clean/core/constants/app_strings.dart';
import 'package:demo_flutter_app/architecture/clean/features/presentation/bloc/chapter/chapter_bloc.dart';
import 'package:demo_flutter_app/architecture/clean/features/presentation/bloc/chapter/chapter_event.dart';
import 'package:demo_flutter_app/architecture/clean/features/presentation/bloc/chapter/chapter_state.dart';
import 'package:demo_flutter_app/architecture/clean/features/presentation/screen/chapter/components/card_chapter.dart';
import 'package:demo_flutter_app/architecture/clean/features/presentation/widget/common/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/entities/chapter/chapter_listings_entity.dart';

class ChapterScreen extends StatelessWidget {

  const ChapterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GetIt.I<ChapterBloc>()..add(ChapterFetching()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[400],
          title: const Text(AppStrings.selectChapter),
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return BlocBuilder<ChapterBloc, ChapterState>(builder: (context, state) {
      if (state is ChapterLoading) {
        return AppLoading();
      } else if (state is ChapterSuccess) {
        return _chapterList(state.chapters!);
      } else {
        return const Text('no data');
      }
    });
  }

  _chapterList(ChapterListingsEntity chapters) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: chapters.chapters!.length,
        itemBuilder: (context, index) {
          var chapter = chapters.chapters![index];

          return CardChapter(
              id: chapter.chapterId!,
              name: chapter.chapterName!,
              isSelected: chapter.isSelected!);
        });
  }
}
