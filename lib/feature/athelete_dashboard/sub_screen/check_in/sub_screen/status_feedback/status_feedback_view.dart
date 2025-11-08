import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/ui_molecules/primary_textfield/primary_text_field.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StatusFeedbackView extends StatelessWidget {
  const StatusFeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: cw(20)),
        child: AppDismissKeyboard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ch(50),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left logo
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      AssetUtils.backArrow,
                    ),
                  ),
                  const Spacer(),

                  SizedBox(
                      width: cw(158),
                      child: customSlider(4, 3, AppColor.cFFFFFF)),
                  const Spacer()
                ],
              ),
              SizedBox(
                height: ch(40),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          txt: "Stato e feedback",
                          fontSize: AppFontSize.f20,
                          fontWeight: FontWeight.w500,
                          color: AppColor.cFFFFFF,
                          height: 1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ch(8),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          txt:
                              "Raccontaci come ti sei sentito questa settimana per\naiutare il tuo coach a modificare il tuo piano.",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.cFFFFFF.withOpacity(0.5),
                          height: 1,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ch(51),
                    ),
                    AppText(
                      txt: "Energia settimanale",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.cFFFFFF.withOpacity(0.5),
                      height: 1,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: ch(12),
                    ),
                    const DottedSliderLines(
                      titles: ['Basso', 'Moderare', 'Alto'],
                    ),
                    SizedBox(
                      height: ch(20),
                    ),
                    AppText(
                      txt: "Recupero ",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.cFFFFFF.withOpacity(0.5),
                      height: 1,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: ch(12),
                    ),
                    const DottedSliderLines(
                      titles: ['Basso', 'Moderare', 'Alto'],
                    ),
                    SizedBox(
                      height: ch(30),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AssetUtils.writeCheckIcon),
                        SizedBox(
                          width: cw(10),
                        ),
                        Expanded(
                          child: AppText(
                            txt:
                                "Confermo di aver letto e accettato i Termini di utilizzo e l’Informativa sulla privacy.",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.cFFFFFF.withOpacity(0.5),
                            height: 1.3,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: cw(20),
                    ),
                    primaryTextField(
                        border: InputBorder.none,
                        textFieldHeight: ch(150),
                        hintText:
                            "Vuoi lasciare un messaggio al tuo allenatore?"),
                    SizedBox(
                      height: ch(114),
                    ),
                    AppButton(
                        buttonColor: AppColor.primary,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RoutePaths.reviewYourCheckInView,
                          );
                        },
                        text: "Avanti",
                        fontSize: 16,
                        textColor: AppColor.cFFFFFF,
                        fontWeight: FontWeight.w600),
                    SizedBox(
                      height: ch(40),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class DottedSliderLines extends StatelessWidget {
  final List<String> titles;

  const DottedSliderLines({
    super.key,
    required this.titles,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLineWithNodes(titles),
      ],
    );
  }

  Widget _buildLineWithNodes(List<String> titles) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // 🔹 Solid Line
            Container(
              height: ch(2),
              color: AppColor.cFFFFFF,
            ),

            // 🔹 Node points
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                titles.length,
                (index) => Container(
                  width: cw(16),
                  height: ch(16),
                  decoration: const BoxDecoration(
                    color: AppColor.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // 🔹 Titles directly under each node

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            titles.length,
            (index) => Text(
              titles[index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
