import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_submission_section/sub_screens/tutor_submission_section_s1/tutor_submission_section_s1_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/gradients/app_gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TutorSubmissionSectionS1View extends StatelessWidget {
  const TutorSubmissionSectionS1View({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TutorSubmissionSectionS1Controller>(context);

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
                          height: ch(70),
                          width: cw(70),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.c2A2A2A,
                          ),
                          child: Image.asset(AssetUtils.person),
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
                                txt: "Corso: Nozioni di base sulla nutrizione",
                                fontSize: AppFontSize.f14 + 2,
                                color: AppColor.white.withOpacity(0.7),
                              ),
                              SizedBox(height: ch(4)),
                              AppText(
                                txt:
                                    "Modulo: Modulo 2 – Caso di studio sulla dieta equilibrata",
                                fontSize: AppFontSize.f14 + 2,
                                color: AppColor.white.withOpacity(0.7),
                                height: 1.2,
                              ),
                              SizedBox(height: ch(4)),
                              AppText(
                                txt: "Inviato: 15 settembre 2025",
                                fontSize: AppFontSize.f14 + 2,
                                color: AppColor.white.withOpacity(0.7),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ch(24)),
                  AppText(
                    txt: "Case study caricato",
                    fontSize: AppFontSize.f16,
                    color: AppColor.white,
                  ),
                  SizedBox(height: ch(10)),
                  ListView.builder(
                    itemCount: model.modules.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final mod = model.modules[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: ch(10)),
                        padding: EdgeInsets.all(cw(14)),
                        decoration: BoxDecoration(
                          color: AppColor.c313131,
                          borderRadius: BorderRadius.circular(cw(14)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: ch(36),
                              width: cw(36),
                              decoration: const BoxDecoration(
                                color: AppColor.c292929,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: ch(12),
                                  width: cw(12),
                                  child: mod["icon"],
                                ),
                              ),
                            ),
                            SizedBox(width: cw(12)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    txt: mod["title"] ?? "",
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: ch(2)),
                                  AppText(
                                    txt: mod["type"] ?? "",
                                    fontSize: 12,
                                    color: Colors.white54,
                                  ),
                                ],
                              ),
                            ),
                            SvgPicture.asset(AssetUtils.edit)
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: ch(24)),

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
                          txt: "Feedback e azioni",
                          color: AppColor.white,
                          fontSize: AppFontSize.f16,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: ch(20)),
                        TextField(
                          maxLines: 3,
                          style: const TextStyle(color: AppColor.white),
                          decoration: InputDecoration(
                            hintText: "Aggiungi feedback agli studenti...",
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
                        SizedBox(height: ch(14)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ch(24),
                  ),

                  AppButton(
                    onPressed: () {},
                    text: "Approva l'invio",
                    color: AppColor.white,
                    textColor: AppColor.black,
                  ),
                  SizedBox(height: ch(12)),
                  AppButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RoutePaths.tutorSubmissionSectionS2View);
                    },
                    text: "Richiedi il nuovo invio",
                    buttonColor: AppColor.cE04900,
                    textColor: AppColor.white,
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

Widget activityCard({
  required Widget child,
  bool isGradient = true,
  double borderRadius = 16,
  double borderWidth = 2,
  EdgeInsets? padding,
  double? width,
  ImageProvider? image,
  double? height,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      image: image != null
          ? DecorationImage(
              image: image,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  AppColor.background.withOpacity(0.8), BlendMode.darken))
          : null,
      border: Border.all(
          width: isGradient == false ? 3 : 0,
          color: isGradient == false ? AppColor.c2C2C32 : AppColor.transparent),
      gradient: isGradient ? AppGradients.redGradient : null,
      color: isGradient ? null : AppColor.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: isGradient
        ? Padding(
            padding: EdgeInsets.all(borderWidth),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF121212),
                borderRadius: BorderRadius.circular(borderRadius - 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: padding ?? const EdgeInsets.all(16),
              child: child,
            ),
          )
        : Padding(
            padding: padding ?? const EdgeInsets.all(16),
            child: child,
          ),
  );
}
