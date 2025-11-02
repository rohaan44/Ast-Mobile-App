import 'package:ast_official/feature/coach_dashboard/home_screen/coach_home_screen_view.dart';
import 'package:ast_official/feature/coach_dashboard/plans_royalties/athlete_subscriptions/athlete_subscriptions_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/primary_textfield/primary_text_field.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/gradients/app_gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AthleteSubscriptionsView extends StatelessWidget {
  const AthleteSubscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AthleteSubscriptionsController>();

    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ch(20)),

            /// 🔙 Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: cw(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(AssetUtils.backArrow),
                  ),
                  AppText(
                    txt: "Abbonamenti atleti",
                    color: AppColor.white,
                    fontSize: AppFontSize.f19 + 2,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox.shrink(),
                ],
              ),
            ),
            SizedBox(height: ch(25)),

            /// 🔹 Choice Filter List
            SizedBox(
              height: ch(35),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.choiceList.length,
                separatorBuilder: (_, __) => SizedBox(width: cw(10)),
                itemBuilder: (context, index) {
                  final isSelected = controller.selectedChoice == index;
                  return Padding(
                    padding: EdgeInsets.only(
                        left: index == 0 ? cw(20) : 0,
                        right: index == controller.choiceList.length - 1
                            ? cw(20)
                            : 0),
                    child: GestureDetector(
                      onTap: () => controller.selectChoice(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(
                            horizontal: cw(12), vertical: ch(5)),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColor.red
                              : AppColor.c1E1E1E.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: AppText(
                            txt: controller.choiceList[index],
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
                            fontSize: AppFontSize.f15,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: ch(20)),

Padding(
  padding:  EdgeInsets.symmetric(horizontal:cw(20)),
  child: primaryTextField(
                  hintText: "Ricerca",
                  prefixIcon: SvgPicture.asset(AssetUtils.searchIcon),
                  controller: TextEditingController(),
                  onChanged: controller.filterAthletes,
                  border: InputBorder.none,
                  borderRadius: cw(50)),
),
            /// 🔍 Search Field
          

            SizedBox(height: ch(20)),

            /// 🔹 Subscriptions List
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: cw(20)),
                  child: Column(
                    children: [
                      ...controller.filteredSubscriptions.map((s) {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: ch(14)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Avatar
                                  CircleAvatar(
                                    radius: cw(30),
                                    backgroundColor: AppColor.c252525,
                                    child: AppText(
                                      txt: s["name"][0],
                                      color: AppColor.white,
                                      fontSize: AppFontSize.f20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: cw(12)),

                                  // Info
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          txt: s["name"],
                                          color: AppColor.white,
                                         fontWeight: FontWeight.w600,
                                        fontSize: AppFontSize.f16,
                                        ),
                                        AppText(
                                          txt: s["plan"],
                                           color:
                                            AppColor.white.withOpacity(0.7),
                                        fontSize: AppFontSize.f18,
                                        height: 1.5,
                                        ),
                                        SizedBox(height: ch(5)),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: cw(12),
                                              vertical: ch(3)),
                                          decoration: BoxDecoration(
                                            color: const Color(0xff34C759),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: AppText(
                                            txt: s["status"],
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: AppFontSize.f14 + 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Right info
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      AppText(
                                        txt: "Prossima fattura",
                                        color: AppColor.white.withOpacity(0.7),
                                        fontSize: AppFontSize.f15-2,
                                      ),
                                      SizedBox(height: ch(5),),
                                      AppText(
                                        txt: s["billingDate"],
                                        color: AppColor.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: AppFontSize.f15 + 1,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 1,
                              decoration: const BoxDecoration(
                                gradient: AppGradients.redGradient,
                              ),
                            ),
                          ],
                        );
                      }),

                      SizedBox(height: ch(25)),

                      /// 🔹 Summary
                      activityCard(
                        padding: const EdgeInsets.all(0),
                        isGradient: true,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: cw(16), vertical: ch(14)),
                          decoration: BoxDecoration(
                            color: AppColor.c1E1E1E,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    txt: "Abbonamenti \nattivi",
                                    color: AppColor.white.withOpacity(0.7),
                                    fontSize: AppFontSize.f15,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                  ),
                                  SizedBox(height: ch(6)),
                                  AppText(
                                    txt:
                                        controller.activeCount.toString(),
                                    color: const Color(0xff34C759),
                                    fontSize: AppFontSize.f20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  AppText(
                                    textAlign: TextAlign.end,
                                    txt: "Entrate totali degli\nabbonamenti",
                                    color: AppColor.white.withOpacity(0.7),
                                    fontSize: AppFontSize.f15,
                                    height: 1.5,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(height: ch(6)),
                                  AppText(
                                    txt:
                                        "\$${controller.totalRevenue.toStringAsFixed(2)}",
                                    color: const Color(0xff34C759),
                                    fontSize: AppFontSize.f20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: ch(40)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
