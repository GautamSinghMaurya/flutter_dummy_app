import 'package:demo_flutter_app/architecture/clean/features/presentation/bloc/chapter/chapter_event.dart';
import 'package:demo_flutter_app/architecture/clean/features/presentation/widget/common/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../bloc/chapter/chapter_bloc.dart';
import '../../../bloc/chapter/chapter_state.dart';

class CardChapter extends StatelessWidget {
  final bool isSelected;
  final int id;
  final String name;
  final void Function() markCheckBox;

  const CardChapter(
      {super.key,
      required this.id,
      required this.name,
      required this.isSelected,
      required this.markCheckBox});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChapterBloc, ChapterState>(buildWhen: (context, state) {
      if(state is ChapterCheckBoxLoaded) {
        Fluttertoast.showToast(msg: state.msg);
      }
      return state is ChapterSelecting || state is ChapterDeSelecting;
    }, builder: (context, state) {
      if (state is ChapterCheckBoxLoading) {
        return ListTile(title: Text(name), trailing: AppLoading());
      } else {
        return CheckboxListTile(
          title: Text(name),
          value: isSelected,
          onChanged: (bool? value) {
            markCheckBox.call();
          },
        );
      }
    });
  }
}
