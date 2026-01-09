import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/home_screen/sub_screen/your_personalized_plan/your_personalized_plan_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class YourPersonalizedPlanView extends StatefulWidget {
  const YourPersonalizedPlanView({super.key});

  @override
  State<YourPersonalizedPlanView> createState() =>
      _YourPersonalizedPlanViewState();
}

class _YourPersonalizedPlanViewState extends State<YourPersonalizedPlanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: cw(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ch(50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Left logo

                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    AssetUtils.closeIcon,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ch(40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  txt: "Il tuo piano personalizzato è\npronto!",
                  fontSize: AppFontSize.f20,
                  fontWeight: FontWeight.w500,
                  color: AppColor.cFFFFFF,
                  height: 1.5,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: ch(50),
            ),
            Consumer<YourPersonalizedPlanController>(
              builder: (context, model, child) {
                final title = model.catType["title"]!;
                final icons = model.catType["iconImage"]!;
                final calories = model.catType["calories"]!;

                return Wrap(
                  alignment: WrapAlignment.center,
                  spacing: cw(12), // space between horizontal cards
                  runSpacing: 16, // space between rows
                  children: List.generate(title.length, (index) {
                    final isSelected = model.selectedIndex == index;

                    return GestureDetector(
                      onTap: () => model.setSelectIndex(index),
                      child: Container(
                        width: cw(160), // 2 per row
                        height: ch(72),
                        decoration: BoxDecoration(
                          color:
                              isSelected ? AppColor.primary : AppColor.c171717,
                          borderRadius: BorderRadius.circular(20),
                          // border: Border.all(
                          //   color: isSelectedas
                          //       ? AppColor.primary
                          //       : AppColor.c252525,
                          //   width: 1.2,
                          // ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: cw(14)),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                icons[index],
                                width: cw(44),
                                height: ch(44),
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: cw(13)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText(
                                    txt: title[index],
                                    fontSize: AppFontSize.f15,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.cFFFFFF.withOpacity(0.7),
                                  ),
                                  SizedBox(
                                    height: ch(4),
                                  ),
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: calories[index],
                                          style: TextStyle(
                                            fontSize: AppFontSize.f20,
                                            fontWeight: FontWeight.w700,
                                            color: AppColor.cFFFFFF,
                                          )),
                                      TextSpan(
                                          text: index == 0 ? " kcal" : " g",
                                          style: TextStyle(
                                            fontSize: AppFontSize.f15,
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.cFFFFFF
                                                .withOpacity(0.7),
                                          )),
                                    ]),
                                  ),
                                  // AppText(
                                  //   txt: types[index],
                                  //   fontSize: AppFontSize.f19,
                                  //   fontWeight: FontWeight.w500,
                                  //   color: AppColor.cFFFFFF,
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
            const Spacer(),
            Consumer<YourPersonalizedPlanController>(
              builder: (context, model, child) {
                bool isNext = model.selectCat.isNotEmpty;
                return AppButton(
                    isButtonEnable: isNext,
                    buttonColor: AppColor.primary,
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, RoutePaths.dashboardView, (route) => false);
                    },
                    text: "Procedi con il piano",
                    fontSize: AppFontSize.f16,
                    textColor: AppColor.cFFFFFF,
                    fontWeight: FontWeight.w600);
              },
            ),
            SizedBox(
              height: ch(32),
            )
          ],
        ),
      ),
    );
  }
}
