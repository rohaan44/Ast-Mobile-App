import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_certificate_section/sub_screens/tutor_certificate_section_s2/tutor_certificate_section_s2_controller.dart';
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

class TutorCertificateSectionS2View extends StatelessWidget {
  const TutorCertificateSectionS2View({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TutorCertificateSectionS2Controller>(context);

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
                                txt:
                                    "Scadenza del certificato precedente: 15 ottobre 2025",
                                fontSize: AppFontSize.f14,
                                color: AppColor.white.withOpacity(0.7),
                                height: 1.2,
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
                              color: AppColor.c34C759,
                              borderRadius: BorderRadius.circular(cw(30)),
                            ),
                            child: Center(
                              child: AppText(
                                txt: "Idoneo per la certificazione",
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

                  ListView.builder(
                    shrinkWrap: true, // important inside SingleChildScrollView
                    physics:
                        const NeverScrollableScrollPhysics(), // disable scrolling
                    itemCount: model.test.length,
                    itemBuilder: (context, index) {
                      final item = model.test[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: ch(24)),
                        padding: EdgeInsets.symmetric(
                            vertical: ch(16), horizontal: cw(12)),
                        decoration: BoxDecoration(
                            color: AppColor.c1E1E1E, // matching your dark theme
                            borderRadius: BorderRadius.circular(cw(20)),
                            border: Border.all(color: AppColor.c656565)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: AppText(
                                txt: item["title"]!,
                                fontSize: AppFontSize.f16,
                                fontWeight: FontWeight.w500,
                                color: AppColor.white,
                              ),
                            ),
                            SizedBox(width: cw(8)),
                            AppText(
                              txt: item["value"]!,
                              fontSize: AppFontSize.f15,
                              fontWeight: FontWeight.w400,
                              color: AppColor.c34C759,
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  AppButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RoutePaths.tutorCertificateSectionS3View);
                    },
                    text: "Emettere certificato",
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
