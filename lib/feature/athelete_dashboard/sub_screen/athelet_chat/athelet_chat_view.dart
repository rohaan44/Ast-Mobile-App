import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dotted_border/dotted_border.dart';

class AtheletChatView extends StatelessWidget {
  const AtheletChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ch(86)),
        child: _appBar(context: context),
      ),
      body: Column(
        children: [
          SizedBox(
            height: ch(48),
          ),
          SvgPicture.asset(AssetUtils.stickerIcon),
          SizedBox(
            height: ch(24),
          ),
          AppText(
            txt: "Benvenuto in Chat!",
            fontWeight: FontWeight.w500,
            fontSize: 16,
            height: 1.2,
          ),
          SizedBox(
            height: ch(12),
          ),
          AppText(
            txt:
                "Sentiti libero di iniziare una nuova conversazione\ncon il tuo coach toccando il pulsante qui sotto.",
            height: 1.2,
            fontWeight: FontWeight.w400,
            fontSize: 12,
            textAlign: TextAlign.center,
            color: AppColor.cFFFFFF.withOpacity(0.7),
          ),
          SizedBox(
            height: ch(24),
          ),
          Center(
            child: DottedBorder(
              color: AppColor.cFFFFFF,
              strokeWidth: 2,
              dashPattern: [6, 4], // ✅ [dash length, space length]
              borderType: BorderType.RRect,
              radius: const Radius.circular(50), // ✅ For rounded corners
              child: Container(
                width: cw(161),
                height: ch(38),
                alignment: Alignment.center,
                color: Colors.transparent, // ✅ Optional
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AssetUtils.addIcon),
                    SizedBox(
                      width: cw(8),
                    ),
                    AppText(
                      txt: "Aggiungi un coach",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      height: 1.2,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              txt: "Chats",
              fontWeight: FontWeight.w700,
              fontSize: 16,
              height: 1.5,
            ),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(AssetUtils.searchIcon),
            ),
          ],
        ),
      ],
    ),
  );
}
