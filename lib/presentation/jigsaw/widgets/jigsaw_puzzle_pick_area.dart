import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:jigsaw/data/models/jigsaw_puzzle_data.dart';

class JigsawPuzzlePickAreaWidget extends StatelessWidget {
  final ui.Image srcImage;
  final List<int> correctIdList;

  const JigsawPuzzlePickAreaWidget({
    Key? key,
    required this.srcImage,
    required this.correctIdList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildPickAreaWidget(context, _generatePickCardMap(correctIdList));
  }

  Widget _buildPickAreaWidget(
      BuildContext context, Map<int, Widget> pickCardMap) {
    List<Widget> widgetList = pickCardMap.keys.map((key) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: pickCardMap[key],
      );
    }).toList();

    return SizedBox(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 52),
        child: Column(
          children: widgetList,
        ),
      ),
    );
  }

  Map<int, Widget> _generatePickCardMap(List<int> correctIdList) {
    Map<int, Widget> dataMap =
        JigsawPuzzleDataGenerator.generatePickJigsawPuzzleCardWidgetMap(
      image: srcImage,
      correctIdList: correctIdList,
    );
    List<int> keys = dataMap.keys.toList();

    Map<int, Widget> pickCardMap = {};
    for (var element in keys) {
      if (dataMap[element] != null) {
        pickCardMap[element] = dataMap[element]!;
      }
    }
    return pickCardMap;
  }
}
