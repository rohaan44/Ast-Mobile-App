import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/on_boarding/auth/forget_password/forget_password_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/ui_molecules/primary_textfield/primary_text_field.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ForgetPasswordController>();

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: cw(20), vertical: ch(30)),
        child: AppButton(
          // isLoading: provider.isLoading,
          isButtonEnable: provider.isButtonEnabled,
          borderRadius: cw(50),
          onPressed: () async {
            Navigator.pushNamed(context, RoutePaths.resetPasswordScreen);
            // final flowProvider =
            //     context.read<FlowDataProvider>();
            // final data = flowProvider
            //     .getFlowData(customerOnboarding);
            // log(data.toString());

            // if (data != null && data.containsKey("value")) {
            //   final success = await provider.register(
            //       data["value"], context);
            //   if (success) {
            //     // ignore: use_build_context_synchronously
            //     showApiSnackBar(context,
            //         title: "Success",
            //         message: "OTP sent successfully",
            //         isSuccess: true);
            //     Navigator.pushNamed(
            //         context, RoutePaths.otpView);
            //   }
            // } else {
            //   showApiSnackBar(context,
            //       title: "Error",
            //       message:
            //           "Flow data missing for registration",
            //       isSuccess: false);
            // }
          },
          text: "Continua",
        ),
      ),
      body: AppDismissKeyboard(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: cw(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ch(45)),
              // --- Header ---
              Row(
                children: [
                  SvgPicture.asset(AssetUtils.walkthroughIcon),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutePaths.signIn);
                    },
                    child: const Icon(
                      Icons.close,
                      color: AppColor.cFFFFFF,
                      size: 20,
                    ),
                  )
                ],
              ),
              SizedBox(height: ch(30)),
              AppText(
                txt: "dimenticare la password",
                fontSize: AppFontSize.f20,
                fontWeight: FontWeight.w500,
                color: AppColor.cFFFFFF,
              ),
              SizedBox(height: ch(12)),
              AppText(
                txt: "inserisci la tua email per confermare la password",
                fontSize: AppFontSize.f18,
                fontWeight: FontWeight.w400,
                color: AppColor.cFFFFFF.withOpacity(0.5),
                height: 1.5,
              ),
              SizedBox(height: ch(25)),
              primaryTextField(
                hintText: "Indirizzo E-mail",
                prefixIcon: SvgPicture.asset(AssetUtils.emailIcon),
                // suffixIcon: provider.isEmailValid
                //     ? SvgPicture.asset(
                //         AssetUtils.isValidate,
                //         width: cw(13.3),
                //         height: ch(13.3),
                //       )
                //     : null,
                controller: provider.emailController,
                onChanged: (_) => provider.onTextChanged(),
                fillColor: AppColor.c161616,
                border: InputBorder.none,
                inputFormatters: [],
              ),
              SizedBox(height: ch(16)),
            ],
          ),
        ),
      ),
    );
  }
}
