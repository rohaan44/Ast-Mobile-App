import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/ui_molecules/primary_textfield/primary_text_field.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';

class TutorProfileSettingsSectionS3View extends StatelessWidget {
  const TutorProfileSettingsSectionS3View({super.key});

  @override
  Widget build(BuildContext context) {
    // final model = Provider.of<TutorProfileSettingsSectionS3Controller>(context);

    return AppDismissKeyboard(
      child: Scaffold(
        backgroundColor: AppColor.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: cw(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: ch(12)),

                // HEADER
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
                          txt: "Cambiare la password",
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

                SizedBox(height: ch(20)),

                primaryTextField(
                  hintText: "Password attuale",
                  border: InputBorder.none,
                ),
                SizedBox(height: ch(24)),

                primaryTextField(
                  hintText: "Nuova password",
                  border: InputBorder.none,
                ),
                SizedBox(height: ch(24)),

                primaryTextField(
                  hintText: "Conferma nuova password",
                  border: InputBorder.none,
                ),
                SizedBox(height: ch(24)),

                AppButton(
                  onPressed: () {
                    // Navigator.pushNamed(
                    //     context, RoutePaths.tutorCourseSectionS5View);
                  },
                  text: "Aggiorna password",
                  fontSize: AppFontSize.f18,
                ),

                SizedBox(height: ch(24)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
