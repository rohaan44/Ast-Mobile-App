import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_certificate_section/sub_screens/tutor_certificate_section_s4/tutor_certificate_section_s4_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TutorCertificateSectionS4View extends StatelessWidget {
  const TutorCertificateSectionS4View({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TutorCertificateSectionS4Controller>(context);

    return AppDismissKeyboard(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: cw(24)),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: ch(12)),
                  Row(
                    children: [
                      IconButton(
                        highlightColor: AppColor.transparent,
                        focusColor: AppColor.transparent,
                        splashColor: AppColor.transparent,
                        icon: SvgPicture.asset(AssetUtils.backArrow),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Expanded(
                        child: Center(
                          child: AppText(
                            txt: "Promemoria di rinnovo",
                            fontSize: AppFontSize.f16 + 4,
                            isItalic: true,
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(width: cw(40)),
                    ],
                  ),
                  _buildSearchTextField(
                    hintText: "Inserisci una nuova data di scadenza",
                    svgIconPath: AssetUtils.searchIcon, // your SVG path here
                  ),
                  SizedBox(height: ch(24)),
                  AppButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RoutePaths.tutorCertificateSectionView);
                    },
                    text: "Rinnova tutto",
                    color: AppColor.white,
                    textColor: AppColor.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildSearchTextField(
    {required String hintText, required String svgIconPath}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: ch(8)),
    child: TextField(
      style: const TextStyle(color: AppColor.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: AppFontSize.f15,
          fontWeight: FontWeight.w400,
          color: AppColor.c8E8E8E.withOpacity(0.5),
        ),
        filled: true,
        fillColor: AppColor.c151515,
        prefixIcon: Padding(
          padding: EdgeInsets.all(cw(12)), // adjust padding
          child: SvgPicture.asset(
            svgIconPath,
            width: cw(20),
            height: ch(20),
            color: AppColor.white,
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: cw(40),
          minHeight: ch(40),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColor.c454545, width: cw(1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColor.c252525, width: cw(1)),
        ),
        contentPadding:
            EdgeInsets.symmetric(horizontal: ch(16), vertical: cw(16)),
      ),
    ),
  );
}
