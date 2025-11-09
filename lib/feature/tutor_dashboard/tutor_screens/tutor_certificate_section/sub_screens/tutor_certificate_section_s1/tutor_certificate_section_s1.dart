import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TutorCertificateSectionS1View extends StatelessWidget {
  const TutorCertificateSectionS1View({super.key});

  @override
  Widget build(BuildContext context) {
    // final model = Provider.of<TutorCertificateSectionS1Controller>(context);

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
                            txt: "Particolare dello studente",
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

                  // 🔹 Student Card
                  Container(
                    padding: EdgeInsets.all(cw(16)),
                    decoration: BoxDecoration(
                      color: AppColor.c1E1E1E,
                      borderRadius: BorderRadius.circular(cw(16)),
                      border:
                          Border.all(color: AppColor.cE04900.withOpacity(0.4)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Avatar
                        Container(
                          height: ch(48),
                          width: cw(48),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.c2A2A2A,
                          ),
                          alignment: Alignment.center,
                          child: AppText(
                            txt: "JD",
                            fontSize: AppFontSize.f16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.white,
                          ),
                        ),
                        SizedBox(width: cw(12)),

                        // Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                txt: "John Doe",
                                fontSize: AppFontSize.f16,
                                fontWeight: FontWeight.w600,
                                color: AppColor.white,
                              ),
                              SizedBox(height: ch(4)),
                              AppText(
                                txt: "Corso: Allenamento di forza avanzato",
                                fontSize: AppFontSize.f14,
                                color: AppColor.white.withOpacity(0.7),
                              ),
                              SizedBox(height: ch(4)),
                              AppText(
                                txt: "Data di completamento: 12 settembre 2025",
                                fontSize: AppFontSize.f14,
                                color: AppColor.white.withOpacity(0.7),
                              ),
                            ],
                          ),
                        ),

                        // Status Badge
                        Padding(
                          padding: EdgeInsets.only(bottom: ch(32)),
                          child: Container(
                            // height: ch(22),
                            // width: cw(59),
                            padding: EdgeInsets.symmetric(
                                vertical: ch(5), horizontal: cw(10)),
                            decoration: BoxDecoration(
                              color: AppColor.cFF8D28,
                              borderRadius: BorderRadius.circular(cw(30)),
                            ),
                            child: Center(
                              child: AppText(
                                txt: "In scadenza a breve",
                                color: AppColor.white,
                                fontSize: AppFontSize.f14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ch(24),
                  ),
                  Container(
                    padding: EdgeInsets.all(cw(10)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(cw(10)),
                      border: Border.all(color: AppColor.c656565),
                      color: AppColor.c1E1E1E,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          txt: "Opzioni di rinnovo",
                          color: AppColor.white,
                          fontSize: AppFontSize.f16,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: ch(20)),
                        TextField(
                          style: const TextStyle(color: AppColor.white),
                          decoration: InputDecoration(
                            hintText: "Inserisci una nuova data di scadenza",
                            hintStyle: TextStyle(
                              fontSize: AppFontSize.f15,
                              fontWeight: FontWeight.w400,
                              color: AppColor.c8E8E8E.withOpacity(0.5),
                            ),
                            filled: true,
                            fillColor: AppColor.c151515,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: AppColor.c454545, width: cw(1)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: AppColor.c252525, width: cw(1)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: ch(16), vertical: cw(16)),
                          ),
                        ),
                        SizedBox(height: ch(8)),
                        TextField(
                          maxLines: 3,
                          style: const TextStyle(color: AppColor.white),
                          decoration: InputDecoration(
                            hintText: "Bio",
                            hintStyle: TextStyle(
                              fontSize: AppFontSize.f15,
                              fontWeight: FontWeight.w400,
                              color: AppColor.c8E8E8E.withOpacity(0.5),
                            ),
                            filled: true,
                            fillColor: AppColor.c151515,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: AppColor.c454545, width: cw(1)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: AppColor.c252525, width: cw(1)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: ch(16), vertical: cw(16)),
                          ),
                        ),
                        SizedBox(height: ch(20)),
                        _buildSwitchItem(),
                        SizedBox(height: ch(14)),
                      ],
                    ),
                  ),
                  SizedBox(height: ch(24)),
                  Container(
                    padding: EdgeInsets.all(cw(16)),
                    decoration: BoxDecoration(
                      color: AppColor.c1E1E1E,
                      borderRadius: BorderRadius.circular(cw(16)),
                      border: Border.all(color: AppColor.c6C6C6C),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          txt: "Anteprima del certificato",
                          color: AppColor.white,
                          fontSize: AppFontSize.f16,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: ch(20)),
                        Container(
                          padding: EdgeInsets.all(cw(16)),
                          decoration: BoxDecoration(
                            color: AppColor.c1E1E1E,
                            borderRadius: BorderRadius.circular(cw(16)),
                            border: Border.all(color: AppColor.c6C6C6C),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Avatar
                              Container(
                                height: ch(48),
                                width: cw(48),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.c2A2A2A,
                                ),
                                alignment: Alignment.center,
                                child: AppText(
                                  txt: "QR",
                                  fontSize: AppFontSize.f16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.white,
                                ),
                              ),
                              SizedBox(width: cw(12)),

                              // Details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      txt: "AST-2025-00923",
                                      fontSize: AppFontSize.f16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.white,
                                    ),
                                    SizedBox(height: ch(4)),
                                    AppText(
                                      txt:
                                          "Layout del certificato generato automaticamente",
                                      fontSize: AppFontSize.f14,
                                      color: AppColor.white.withOpacity(0.7),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ch(24)),
                  AppButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RoutePaths.tutorCertificateSectionS2View);
                    },
                    text: "Rinnovare il certificato",
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

Widget _buildSwitchItem() {
  return Row(
    children: [
      AppText(
        txt: "Inviare una notifica via email allo\nstudente?",
        fontSize: AppFontSize.f16,
        color: AppColor.white,
      ),
      const Spacer(),
      Transform.scale(
        scale: 0.6, // Adjust scale to match desired size
        child: SizedBox(
          width: 28,
          height: 15,
          child: Switch(
            value: true,
            onChanged: (value) {},
            activeColor: AppColor.c5CCC6F,
          ),
        ),
      ),
    ],
  );
}
