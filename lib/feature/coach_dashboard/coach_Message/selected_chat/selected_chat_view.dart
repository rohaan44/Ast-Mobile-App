import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_helper/app_constant.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SelectedChatView extends StatelessWidget {
  const SelectedChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.read<FlowDataProvider>().getFlowData(customerOnboarding);
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        elevation: 0,
        leading: IconButton(
          highlightColor: AppColor.transparent,
          focusColor: AppColor.transparent,
          splashColor: AppColor.transparent,
          icon: SvgPicture.asset(AssetUtils.backArrow),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: cw(18),
              backgroundImage: NetworkImage(data!["image"].toString()),
            ),
            SizedBox(width: cw(10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  txt: data["name"].toString(),
                  fontSize: AppFontSize.f18,
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: data["isOnline"] ? Colors.green : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: cw(5)),
                    AppText(
                      txt: data["isOnline"] ? "Online" : "Offline",
                      color: AppColor.white.withOpacity(0.7),
                      fontSize: AppFontSize.f13,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
             highlightColor: AppColor.transparent,
          focusColor: AppColor.transparent,
          splashColor: AppColor.transparent,
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 Date
            Padding(
              padding: EdgeInsets.symmetric(vertical: ch(15)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: cw(14), vertical: ch(5)),
                decoration: BoxDecoration(
                  color: AppColor.c171717,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: AppText(
                  txt: "21 Ago 2025",
                  color: AppColor.white.withOpacity(0.8),
                  fontSize: AppFontSize.f15,
                ),
              ),
            ),

            // 🔹 Encryption info
            Container(
              margin: EdgeInsets.symmetric(horizontal: cw(20)),
              padding: EdgeInsets.symmetric(horizontal: cw(20), vertical: ch(15)),
              decoration: BoxDecoration(
                color: AppColor.c171717,
                border: Border.all(color: AppColor.c1E1E1E,),
                borderRadius: BorderRadius.circular(20),
              ),
              child: AppText(
                txt:
                    "Le tue conversazioni e i tuoi file sono criptati end-to-end. Solo tu e il tuo coach potete leggerli, ascoltarli o condividerli.",
                color: AppColor.c00C8B3,
                textAlign: TextAlign.center,
                fontSize: AppFontSize.f15,
                height: 1.4,
              ),
            ),
            const Spacer(),

            // 🔹 Message input area
            Padding(
              padding: EdgeInsets.only(
                  bottom: ch(10), left: cw(5), right: cw(5), top: ch(10)),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: cw(12)),
                      decoration: BoxDecoration(
                        color: AppColor.c1E1E1E,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AssetUtils.smileIcon),
                          SizedBox(width: cw(8)),

                          Expanded(
                            child: TextField(
                              style:const TextStyle(color: AppColor.white),
                              decoration: InputDecoration(
                                hintText: "Scrivi qualcosa",
                                hintStyle: TextStyle(color: AppColor.white.withOpacity(0.3)),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SvgPicture.asset(AssetUtils.addIcon),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: cw(12)),
                  Container(
                    padding: EdgeInsets.all(cw(10)),
                    decoration: const BoxDecoration(
                      color: AppColor.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.mic, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}