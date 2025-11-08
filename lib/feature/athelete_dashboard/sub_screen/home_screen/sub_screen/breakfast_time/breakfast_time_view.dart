import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/home_screen/sub_screen/breakfast_time/breakfast_time_controller.dart';

import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class BreakFastTimeView extends StatelessWidget {
  const BreakFastTimeView({super.key});

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
                SizedBox(
                    width: cw(158), child: customSlider(5, 4, AppColor.white)),
                Container(
                  width: cw(57),
                  height: ch(26),
                  decoration: BoxDecoration(
                      color: AppColor.c252525,
                      borderRadius: BorderRadius.circular(cw(20))),
                  child: Center(
                    child: AppText(
                      txt: "4 of 5",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColor.cFFFFFF,
                      height: 1,
                    ),
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
                  txt: "Di solito, a che ora fai\ncolazione?",
                  fontSize: AppFontSize.f20,
                  fontWeight: FontWeight.w500,
                  color: AppColor.cFFFFFF,
                  height: 1.5,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: ch(107),
            ),
            SizedBox(
              height: ch(240),
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer<BreakFastTimeController>(
                          builder: (context, dobProvider, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // --- DAY PICKER ---
                            SizedBox(
                              width: cw(70),
                              child: ListWheelScrollView.useDelegate(
                                physics: const FixedExtentScrollPhysics(),
                                itemExtent: ch(40),
                                perspective: 0.008,
                                diameterRatio: 2.5,
                                onSelectedItemChanged: (index) {
                                  dobProvider.setSelectedHour(index);
                                },
                                childDelegate: ListWheelChildBuilderDelegate(
                                  childCount: dobProvider.hours.length,
                                  builder: (context, index) => Center(
                                    child: AppText(
                                      txt: dobProvider.hours[index],
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // --- MONTH PICKER (Italian) ---
                            SizedBox(
                              width: cw(120),
                              child: ListWheelScrollView.useDelegate(
                                physics: const FixedExtentScrollPhysics(),
                                itemExtent: ch(40),
                                perspective: 0.008,
                                diameterRatio: 2.5,
                                onSelectedItemChanged: (index) {
                                  dobProvider.setSelectedMinute(index);
                                },
                                childDelegate: ListWheelChildBuilderDelegate(
                                  childCount: dobProvider.minutes.length,
                                  builder: (context, index) => Center(
                                    child: AppText(
                                      // Assuming AppText is similar to Text
                                      txt: dobProvider.minutes[index],
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                      AppText(
                        txt: "AM",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: ch(45), // highlight the selected item area
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            AppButton(
                buttonColor: AppColor.primary,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RoutePaths.dinnerTimeView, (route) => false);
                },
                text: "Avanti",
                fontSize: 16,
                textColor: AppColor.cFFFFFF,
                fontWeight: FontWeight.w600),
            SizedBox(
              height: ch(32),
            )
          ],
        ),
      ),
    );
  }
}
