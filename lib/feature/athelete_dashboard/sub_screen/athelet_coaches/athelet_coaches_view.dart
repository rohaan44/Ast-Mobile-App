import 'package:ast_official/feature/athelete_dashboard/sub_screen/athelet_coaches/athelet_coaches_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/primary_textfield/primary_text_field.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AtheletCoachesView extends StatelessWidget {
  const AtheletCoachesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ch(86)),
        child: _appBar(context: context),
      ),
      body: AppDismissKeyboard(
        child: Consumer<AtheletCoachesController>(
          builder: (context, model, child) {
            return Column(
              children: [
                SizedBox(height: ch(12)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: cw(20)),
                  child: primaryTextField(
                    textFieldHeight: ch(46),
                    prefixIcon: SvgPicture.asset(AssetUtils.searchIcon),
                    hintText: "Cerca",
                    borderRadius: cw(50),
                    border: InputBorder.none,
                    onChanged: (value) {
                      model.setSearchQuery(value);
                    },
                  ),
                ),
                SizedBox(height: ch(20)),
                categorySelector(model),
                SizedBox(height: ch(12)),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: cw(20)),
                    physics: const BouncingScrollPhysics(),
                    itemCount: model.filteredCoaches.length,
                    separatorBuilder: (_, __) => SizedBox(height: ch(12)),
                    itemBuilder: (context, index) {
                      final coach = model.filteredCoaches[index];
                      final img = coach["img"]!;
                      final title = coach["title"]!;
                      final subTitle = coach["subTitle"]!;
                      return Row(
                        children: [
                          Container(
                            height: ch(44),
                            width: cw(44),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(img),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: cw(8)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                txt: title,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                              SizedBox(height: ch(5)),
                              AppText(
                                txt: subTitle,
                                fontWeight: FontWeight.w400,
                                color: AppColor.cFFFFFF.withOpacity(0.7),
                                fontSize: 10,
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget _appBar({required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: cw(20)),
    child: Column(
      children: [
        SizedBox(height: ch(40)),
        Row(
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(AssetUtils.backArrow),
            ),
            const Spacer(),
            AppText(
              txt: "Allenatori",
              fontWeight: FontWeight.w700,
              fontSize: 16,
              height: 1.5,
            ),
            const Spacer(),
          ],
        ),
      ],
    ),
  );
}

Widget _buildChip(String label, int index, dynamic model) {
  final bool isSelected = model.selectedCategoryIndex == index;

  return InkWell(
    onTap: () => model.setSelectedCategory(index),
    child: AnimatedContainer(
      // height: ch(30),
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: ch(8)),
      decoration: BoxDecoration(
        color: isSelected ? AppColor.primary : Colors.transparent,
        border: Border.all(
          color: isSelected ? Colors.transparent : AppColor.c252525,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: AppText(
          txt: label,
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: AppColor.cFFFFFF,
        ),
      ),
    ),
  );
}

Widget categorySelector(dynamic model) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: cw(0)),
    child: SizedBox(
      height: ch(30),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: cw(20)),
        scrollDirection: Axis.horizontal,
        itemCount: model.categories.length,
        itemBuilder: (context, index) {
          final label = model.categories[index];
          return _buildChip(label, index, model);
        },
      ),
    ),
  );
}
