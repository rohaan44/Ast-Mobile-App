import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/home_screen/sub_screen/what_is_your_diet_type/what_is_your_diet_type_controller.dart';
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

class WhatIsYourDietTypeView extends StatefulWidget {
  const WhatIsYourDietTypeView({super.key});

  @override
  State<WhatIsYourDietTypeView> createState() => _WhatIsYourDietTypeViewState();
}

class _WhatIsYourDietTypeViewState extends State<WhatIsYourDietTypeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: cw(20)),
          child: Column(
            children: [
  SizedBox(
                height: ch(20),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left logo
                GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () =>  Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0), // small tap area
                child: SvgPicture.asset(
                  AssetUtils.backArrow,
                  height: ch(20),
                  width: cw(20),
                ),
              ),
            ),
                  SizedBox(
                      width: cw(158), child: customSlider(5, 3, AppColor.white)),
                  Container(
                    width: cw(57),
                    height: ch(26),
                    decoration: BoxDecoration(
                        color: AppColor.c252525,
                        borderRadius: BorderRadius.circular(cw(20))),
                    child: Center(
                      child: AppText(
                        txt: "3 of 5",
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
                height: ch(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    txt: "Qual è il tuo tipo di dieta?",
                    fontSize: AppFontSize.f20,
                    fontWeight: FontWeight.w500,
                    color: AppColor.cFFFFFF,
                    height: 1,
                  ),
                ],
              ),
              SizedBox(
                height: ch(45),
              ),
              Consumer<WhatIsYourDietTypeController>(
                builder: (context, model, child) {
                  final types = model.catType["type"]!;
                  final icons = model.catType["iconImage"]!;
        
                  return Wrap(
                    alignment: WrapAlignment.center,
                    spacing: cw(12),
                    runSpacing: 16,
                    children: List.generate(types.length, (index) {
                      final isSelected = model.isSelected(index);
                      final int itemCount = types.length;
                      final int lastIndex = itemCount - 1;
                      final bool isLastItem = index == lastIndex;
        
                      // Conditional width based on your specified logic
                      final double itemWidth = isLastItem ? cw(353) : cw(160);
                      return GestureDetector(
                        onTap: () => model.toggleSelection(index),
                        child: Container(
                          width: itemWidth,
                          height: ch(54),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColor.primary
                                : AppColor.c252525.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: isSelected
                                  ? AppColor.primary
                                  : AppColor.c252525,
                              width: 1.2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                icons[index],
                                width: 20,
                              ),
                              const SizedBox(width: 8),
                              AppText(
                                txt: types[index],
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColor.cFFFFFF,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
              const Spacer(),
              AppButton(
                  buttonColor: AppColor.primary,
                  onPressed: () {
                    Navigator.pushNamed(
                        context, RoutePaths.breakFastTimeView);
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
      ),
    );
  }
}
