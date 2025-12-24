import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_profile_settings_section/sub_screens/tutor_profile_settings_section_s2/tutor_profile_settings_section_s2_controller.dart';
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
import 'package:provider/provider.dart';

class TutorProfileSettingsSectionS2View extends StatelessWidget {
  const TutorProfileSettingsSectionS2View({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TutorProfileSettingsSectionS2Controller>(context);

    return AppDismissKeyboard(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: cw(24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            txt: "Aggiungi certificazione",
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
                      hintText: "Nome della certificazione",
                      border: InputBorder.none,
                      suffixIcon: SvgPicture.asset(
                        AssetUtils.dropDownArrow,
                        color: AppColor.cFFFFFF,
                      )),
                  SizedBox(height: ch(24)),

                  primaryTextField(
                    hintText: "Organizzazione emittente",
                    border: InputBorder.none,
                  ),
                  SizedBox(height: ch(24)),

                  primaryTextField(
                    hintText: "Data di emissione",
                    border: InputBorder.none,
                  ),
                  SizedBox(height: ch(24)),

                  primaryTextField(
                    hintText: "Data di scadenza (facoltativa)",
                    border: InputBorder.none,
                  ),
                  SizedBox(height: ch(24)),
                  AppText(
                    txt: "Carica file di certificato",
                    color: AppColor.cFFFFFF,
                    fontSize: AppFontSize.f16,
                  ),
                  SizedBox(height: ch(24)),

                  GestureDetector(
                    onTap: () {
                      model.setUploadedFileName("file_example.pdf");
                    },
                    child: Container(
                      height: ch(219),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          vertical: ch(40), horizontal: cw(16)),
                      decoration: BoxDecoration(
                        color: AppColor.c151515,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColor.c686868,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AssetUtils.uploadIcon),
                          SizedBox(height: ch(8)),
                          AppText(
                            txt: model.uploadedFileName ?? "Tocca per caricare",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                          SizedBox(height: ch(4)),
                          AppText(
                            txt: model.uploadedFileName ??
                                "PDF, JPG, PNG fino a 5 MB",
                            fontSize: 14,
                            color: AppColor.c7E7E7E,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: ch(24)),

                  AppButton(
                    onPressed: () {
                      Navigator.pushNamed(context,
                          RoutePaths.tutorProfileSettingsSectionS3View);
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
      ),
    );
  }
}
