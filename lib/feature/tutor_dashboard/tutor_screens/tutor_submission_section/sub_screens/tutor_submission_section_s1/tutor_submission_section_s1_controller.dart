import 'package:ast_official/utils/asset_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TutorSubmissionSectionS1Controller with ChangeNotifier {
  final List<Map<String, dynamic>> modules = [
    {
      "title": "Modulo 1: Introduzione",
      "type": "Video",
      "icon": SvgPicture.asset(AssetUtils.intro),
    },
  ];
}
