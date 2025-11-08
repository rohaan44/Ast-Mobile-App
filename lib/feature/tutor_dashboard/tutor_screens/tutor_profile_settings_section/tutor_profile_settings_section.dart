import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_profile_settings_section/tutor_profile_settings_section_controller.dart';
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
import 'dart:io';

class TutorProfileSettingsSectionView extends StatelessWidget {
  const TutorProfileSettingsSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TutorProfileSettingsSectionController>(context);

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

                SizedBox(height: ch(24)),

                // PROFILE IMAGE + EDIT/DELETE BUTTONS
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: cw(55),
                      backgroundColor: AppColor.grey,
                      backgroundImage: model.profileImage != null
                          ? FileImage(model.profileImage! as File)
                          : const AssetImage(AssetUtils.scholarCap)
                              as ImageProvider,
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: PopupMenuButton<String>(
                        color: AppColor.grey,
                        onSelected: (value) {
                          if (value == 'upload') {
                            // model.pickProfileImage();
                          } else if (value == 'delete') {
                            model.deleteProfileImage();
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'upload',
                            child: Row(
                              children: [
                                Icon(Icons.upload, color: Colors.white),
                                SizedBox(width: 8),
                                Text("Carica foto",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          if (model.profileImage != null)
                            const PopupMenuItem(
                              value: 'delete',
                              child: Row(
                                children: [
                                  Icon(Icons.delete, color: Colors.red),
                                  SizedBox(width: 8),
                                  Text("Elimina foto",
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                        ],
                        child: Container(
                          padding: EdgeInsets.all(cw(8)),
                          decoration: const BoxDecoration(
                            color: AppColor.blue,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.camera_alt,
                              color: Colors.white, size: 20),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: ch(16)),

                // NAME
                AppText(
                  txt: "Timothy Doe",
                  fontSize: AppFontSize.f24,
                  fontWeight: FontWeight.w600,
                  color: AppColor.cFFFFFF,
                ),

                SizedBox(height: ch(10)),

                AppText(
                  txt: "Tutor - Certificato",
                  fontSize: AppFontSize.f14 + 2,
                  color: AppColor.c34C759,
                  fontWeight: FontWeight.w500,
                ),

                SizedBox(height: ch(10)),

                AppText(
                  txt:
                      "Appassionato nell’aiutare gli studenti a ottenere le loro\ncertificazioni nel fitness e a eccellere nelle loro carriere",
                  fontSize: AppFontSize.f15,
                  color: AppColor.c888888,
                  textAlign: TextAlign.center,
                  height: 1.2,
                ),

                SizedBox(height: ch(10)),

                // VIEW PROFILE BUTTON
                AppButton(
                  onPressed: () {},
                  width: cw(91),
                  height: ch(28),
                  buttonColor: AppColor.cEB5725,
                  text: "Visualizza profilo",
                  fontWeight: FontWeight.w400,
                  fontSize: AppFontSize.f14 + 2,
                  textColor: AppColor.cFFFFFF,
                ),

                SizedBox(height: ch(32)),

                // MENU ITEMS
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildMenuItem(
                        icon: AssetUtils.user,
                        label: "Modifica profilo",
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        icon: AssetUtils.language,
                        label: "Selettore della lingua",
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        icon: AssetUtils.lock,
                        iconColor: AppColor.cEB5725,
                        label: "Cambiare la password",
                        onTap: () {},
                      ),
                      _buildNotificationItem(),
                      _buildMenuItem(
                        icon: AssetUtils.exit,
                        label: "Esci",
                        labelColor: AppColor.cFF3A2F,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String icon,
    required String label,
    Color? labelColor,
    Color? iconColor,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: ch(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(cw(12)),
        child: Container(
          height: ch(59),
          padding: EdgeInsets.symmetric(horizontal: cw(16), vertical: ch(16)),
          decoration: BoxDecoration(
            color: AppColor.cFFFFFF.withOpacity(0.05),
            borderRadius: BorderRadius.circular(cw(12)),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                color: iconColor,
              ),
              SizedBox(width: cw(16)),
              AppText(
                txt: label,
                fontSize: AppFontSize.f16,
                color: labelColor ?? AppColor.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationItem() {
    return Padding(
      padding: EdgeInsets.only(bottom: ch(12)),
      child: Container(
        height: ch(59),
        padding: EdgeInsets.symmetric(horizontal: cw(16), vertical: ch(16)),
        decoration: BoxDecoration(
          color: AppColor.cFFFFFF.withOpacity(0.05),
          borderRadius: BorderRadius.circular(cw(12)),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              AssetUtils.bellIcon,
              color: AppColor.cEB5725,
            ),
            SizedBox(width: cw(16)),
            AppText(
              txt: "Notifiche",
              fontSize: AppFontSize.f16,
              color: AppColor.white,
            ),
            const Spacer(),
            Switch(
              value: true,
              onChanged: (value) {},
              activeColor: AppColor.c5CCC6F,
            ),
          ],
        ),
      ),
    );
  }
}
