import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:jigsaw/presentation/jigsaw/widgets/jigsaw_puzzle_pick_area.dart';
import 'package:jigsaw/presentation/jigsaw/widgets/jigsaw_puzzle_preview.dart';

import '../../../core/utils/utils.dart';

class JigsawPuzzlePage extends StatefulWidget {
  const JigsawPuzzlePage({Key? key}) : super(key: key);

  @override
  State<JigsawPuzzlePage> createState() => _JigsawPuzzlePageState();
}

class _JigsawPuzzlePageState extends State<JigsawPuzzlePage> {
  ui.Image? _srcImage;

  final List<int> _correctIdList = [];

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  void _loadImage() async {
    _srcImage = await ImageUtils.loadAssetImage('images/test_img.jpg');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_srcImage == null) {
      return Container();
    }
    return _buildPageContentWidget();
  }

  Widget _buildPageContentWidget() {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green,
        child: Row(
          children: [
            JigsawPuzzlePreviewWidget(
              srcImage: _srcImage!,
              correctCallback: (id) {
                setState(() {
                  _correctIdList.add(id);
                });
              },
            ),
            JigsawPuzzlePickAreaWidget(
              srcImage: _srcImage!,
              correctIdList: _correctIdList,
            ),
          ],
        ),
      ),
    );
  }
}
