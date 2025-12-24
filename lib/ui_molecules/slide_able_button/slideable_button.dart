// ignore_for_file: sort_child_properties_last, library_private_types_in_public_api, use_super_parameters

import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_widget.dart';

class SlideAbleButtonView extends StatefulWidget {
  final VoidCallback onFinish;

  /// Event waiting for the process to finish
  final VoidCallback onWaitingProcess;

  /// Animation finish control
  final bool isFinished;

  /// Button is active value default : true
  final bool isActive;

  /// Button active color value
  final Color activeColor;

  /// Button disable color value
  final Color? disableColor;

  /// Swipe button widget
  final Widget buttonWidget;

  /// Button color default : Colors.white
  final Color? buttonColor;

  /// Button center text
  final Widget buttonText;

  /// Button text style
  final TextStyle? buttontextstyle;

  final Color? borderColor;

  final List<dynamic>? buttonGradient;

  /// Circle indicator color
  final Animation<Color?>? indicatorColor;
  const SlideAbleButtonView(
      {Key? key,
      required this.onFinish,
      required this.onWaitingProcess,
      required this.activeColor,
      required this.buttonWidget,
      required this.buttonText,
      this.borderColor,
      this.buttonGradient,
      this.isFinished = false,
      this.isActive = true,
      this.disableColor = Colors.grey,
      this.buttonColor = Colors.white,
      this.buttontextstyle =
          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      this.indicatorColor = const AlwaysStoppedAnimation<Color>(Colors.white)})
      : super(key: key);

  @override
  _SlideAbleButtonViewState createState() => _SlideAbleButtonViewState();
}

class _SlideAbleButtonViewState extends State<SlideAbleButtonView>
    with TickerProviderStateMixin {
  bool isAccepted = false;
  double opacity = 1;
  bool isFinishValue = false;
  bool isStartRippleEffect = false;
  late AnimationController _controller;

  bool isScaleFinished = false;

  late AnimationController rippleController;
  late AnimationController scaleController;

  late Animation<double> rippleAnimation;
  late Animation<double> scaleAnimation;

  init() {
    setState(() {
      isAccepted = false;
      opacity = 1;
      isFinishValue = false;
      isStartRippleEffect = false;
    });
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      isFinishValue = widget.isFinished;
    });

    rippleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            isFinishValue = true;
          });
          widget.onFinish();
        }
      });
    rippleAnimation =
        Tween<double>(begin: 60.0, end: 90.0).animate(rippleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              rippleController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              rippleController.forward();
            }
          });
    scaleAnimation =
        Tween<double>(begin: 1.0, end: 30.0).animate(scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                isScaleFinished = true;
              });
            }
          });

    //rippleController.forward();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {});
  }

  @override
  void dispose() {
    _controller.dispose();
    rippleController.dispose();
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isFinished) {
      setState(() {
        isStartRippleEffect = true;
        isFinishValue = true;
      });
      scaleController.forward();
    } else {
      if (isFinishValue) {
        scaleController.reverse().then((value) {
          init();
        });
      }
    }
    return Container(
      width: isAccepted
          ? (MediaQuery.of(context).size.width -
              ((MediaQuery.of(context).size.width - 60) * _controller.value))
          : double.infinity,
      height: ch(50),
      decoration: BoxDecoration(
          border: Border.all(color: widget.borderColor ?? AppColor.primary),
          color: widget.isActive ? widget.activeColor : widget.disableColor,
          borderRadius: BorderRadius.circular(cw(18))),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Opacity(
              opacity: opacity,
              child: widget.buttonText,
            ),
          ),
          !isAccepted
              ? SwipeableWidget(
                  isActive: widget.isActive,
                  height: 60.0,
                  onSwipeValueCallback: (value) {
                    setState(() {
                      opacity = value;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: cw(4), vertical: ch(4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: cw(42),
                          height: ch(42),
                          child: Center(
                            child: widget.buttonWidget,
                          ),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [AppColor.cFF4343, AppColor.cFF8D28]),
                              borderRadius: BorderRadius.circular(cw(16)),
                              color: widget.buttonColor),
                        ),
                      ],
                    ),
                  ),
                  onSwipeCallback: () {
                    widget.onWaitingProcess();
                    setState(() {
                      isAccepted = true;
                    });
                    _controller.animateTo(1.0,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.fastOutSlowIn);
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(
                  color: AppColor.primary,
                ))
          //  SizedBox(),
          // AnimatedBuilder(
          //     animation: rippleAnimation,
          //     builder: (context, child) => Container(
          //       width: rippleAnimation.value,
          //       height: rippleAnimation.value,
          //       child: AnimatedBuilder(
          //           animation: scaleAnimation,
          //           builder: (context, child) => Transform.scale(
          //                 scale: scaleAnimation.value,
          //                 child: Container(
          //                   decoration: BoxDecoration(
          //                     shape: BoxShape.circle,
          //                     color: widget.activeColor.withOpacity(0.4),
          //                   ),
          //                   child: Padding(
          //                     padding: EdgeInsets.all(4.0),
          //                     child: Container(
          //                         child: Center(
          //                           child: !isFinishValue
          //                               ? CircularProgressIndicator(
          //                                   valueColor:
          //                                       widget.indicatorColor)
          //                               : SizedBox(),
          //                         ),
          //                         decoration: BoxDecoration(
          //                             shape: BoxShape.circle,
          //                             color: widget.isActive
          //                                 ? widget.activeColor
          //                                 : widget.disableColor)),
          //                   ),
          //                 ),
          //               )),
          //     ),
          //   )
        ],
      ),
    );
  }
}
