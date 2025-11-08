import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_profile_settings_section/sub_screens/tutor_profile_settings_section_s1/tutor_profile_settings_section_s1_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/primary_textfield/primary_text_field.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class TutorProfileSettingsSectionS1View extends StatelessWidget {
  const TutorProfileSettingsSectionS1View({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TutorProfileSettingsSectionS1Controller>(context);

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

                /// HEADER
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
                          txt: "Profilo e impostazioni",
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

                SizedBox(height: ch(40)),

                /// PROFILE IMAGE PICKER
                GestureDetector(
                  onTap: () async {
                    if (model.profileImage != null) {
                      // If image exists, delete it
                      model.deleteProfileImage();
                    } else {
                      // Pick a new one
                      await model.pickProfileImage();
                    }
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: ch(120),
                        width: ch(120),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.redAccent, width: 3),
                        ),
                        child: ClipOval(
                          child: model.profileImage != null
                              ? Image.file(
                                  model.profileImage as File,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  color: AppColor.black.withOpacity(0.1),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      AssetUtils.profileUpload,
                                      // height: ch(40),
                                    ),
                                  ),
                                ),
                        ),
                      ),

                      /// Camera Icon Overlay
                      Positioned(
                        bottom: 4,
                        right: 4,
                        child: Container(
                          height: ch(28),
                          width: ch(28),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // color: AppColor.black,
                            // border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              AssetUtils.cameraIcon,
                              height: ch(14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: ch(12)),
                AppText(
                  txt: model.profileImage != null
                      ? "Tocca per eliminare foto"
                      : "Tocca per cambiare foto",
                  color: AppColor.white,
                  fontSize: AppFontSize.f14,
                ),
                SizedBox(height: ch(44)),
                primaryTextField(
                    hintText: "Nome e cognome", border: InputBorder.none),
                SizedBox(height: ch(15)),
                primaryTextField(hintText: "E-mail", border: InputBorder.none),
                SizedBox(height: ch(15)),
                primaryTextField(
                    hintText: "Telefono (facoltativo)",
                    border: InputBorder.none),
                SizedBox(height: ch(15)),
                TextField(
                  maxLines: 5,
                  style: TextStyle(color: AppColor.white),
                  decoration: InputDecoration(
                    hintText: "Bio",
                    hintStyle: TextStyle(
                      fontSize: AppFontSize.f15,
                      fontWeight: FontWeight.w400,
                      color: AppColor.cFFFFFF.withOpacity(0.5),
                    ),
                    filled: true,
                    fillColor: AppColor.c151515,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: AppColor.c252525, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: AppColor.c252525, width: 1),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(40, 16, 16, 16),
                  ),
                ),
                SizedBox(height: ch(15)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
