import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class TrainingComplete extends StatelessWidget {
  const TrainingComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: cw(20)),
          child: Column(
            children: [
              SizedBox(
                height: ch(127),
              ),
              SvgPicture.asset(AssetUtils.redDumble),
              SizedBox(
                height: ch(16),
              ),
              AppText(
                txt: "Allenamento completato",
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: ch(16),
              ),
              AppText(
                txt: "Hai completato l’allenamento di oggi.",
                fontSize: 14,
                color: AppColor.cFFFFFF.withOpacity(0.5),
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: ch(36),
              ),
              topContainer(),
              SizedBox(
                height: ch(36),
              ),
              Container(
                height: ch(207),
                width: 100.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(cw(20)),
                    color: AppColor.c171717,
                    border: Border.all(color: AppColor.c252525)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularPercentIndicator(
                      radius: 45.0,
                      lineWidth: cw(5),
                      percent: 0.5,
                      animation: true,
                      progressColor: AppColor.red,
                      animationDuration: 1000,
                      circularStrokeCap: CircularStrokeCap.round,
                      // linearGradient: const LinearGradient(
                      //     colors: [AppColor.primary, AppColor.cB8A1FF]),
                      backgroundColor: AppColor.c1E1E1E,
                    ),
                    SizedBox(
                      height: ch(30),
                    ),
                    AppText(
                      txt: "In riposo...",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: ch(5),
                    ),
                    AppText(
                      txt: "Ancora un esercizio da fare",
                      fontSize: 12,
                      color: AppColor.cFFFFFF.withOpacity(0.7),
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              AppButton(
                  isButtonEnable: false,
                  showIcon: true,
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        txt: "Prossimo allenamento",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                        width: cw(8),
                      ),
                      const Icon(
                        Icons.play_arrow_outlined,
                        color: AppColor.cFFFFFF,
                      ),
                    ],
                  ),
                  onPressed: () {}),
              SizedBox(
                height: ch(40),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget topContainer() {
  return Container(
    height: ch(75),
    width: 100.w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cw(20)),
        color: AppColor.c171717,
        border: Border.all(color: AppColor.c252525)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              txt: "1",
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: ch(5),
            ),
            AppText(
              txt: "Esercizi",
              fontSize: 12,
              color: AppColor.cFFFFFF.withOpacity(0.5),
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        SizedBox(
          width: cw(42),
        ),
        AppText(
          txt: "|",
          fontSize: 20,
          color: AppColor.c454545,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(
          width: cw(42),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              txt: "3",
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: ch(5),
            ),
            AppText(
              txt: "Serie",
              fontSize: 12,
              color: AppColor.cFFFFFF.withOpacity(0.5),
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        SizedBox(
          width: cw(42),
        ),
        AppText(
          txt: "|",
          fontSize: 20,
          color: AppColor.c454545,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(
          width: cw(20),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              txt: "6",
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: ch(5),
            ),
            AppText(
              txt: "Esercizi",
              fontSize: 12,
              color: AppColor.cFFFFFF.withOpacity(0.5),
              fontWeight: FontWeight.w400,
            ),
          ],
        )
      ],
    ),
  );
}
