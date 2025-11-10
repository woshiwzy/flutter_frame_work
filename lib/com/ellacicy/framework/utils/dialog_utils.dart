import 'package:ellacicy_framework/com/ellacicy/framework/custom/ext_widget/widget_util.dart';
import 'package:ellacicy_framework/com/ellacicy/framework/utils/sized_box_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';


class DialogUtils {
  static var totalHeight = 255.h;
  static var totalWidth = 315.h;

  static String currentDialogMessage = "";
  static bool currentDialogShowing = false;

  static void showBasicDialog(
    BuildContext context,
    String message, {
    String cancelMsg = "取消",
    String confirmMsg = "确认",
    String title = "",
    TextStyle? messageStyle,
    required VoidCallback onTapConfirm,
    required VoidCallback onTapCancel,
  }) {
    title = (title.isEmpty ? "tips".tr : title);
    confirmMsg = "confirm".tr;
    cancelMsg = "cancel".tr;
    messageStyle = messageStyle ?? GoogleFonts.roboto(color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w400);

    if (message == currentDialogMessage && currentDialogShowing == true) {
      return;
    }

    YYDialog yydialog = YYDialog().build(context)
      ..width = totalWidth
      ..height = totalHeight
      ..borderRadius = 20.r
      ..backgroundColor = Colors.transparent
      ..widget(Container(
        // color: Colors.red,
        width: totalWidth,
        height: totalHeight,
        child: Stack(
          children: [
            //content
            Container(
              // color: Colors.green,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    child: Container(
                      color: Colors.white,
                      height: 180.h,
                      width: totalWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Image.asset(
                            "images/coffee.gif",
                            width: 80.w,
                            height: 60.h,
                          ),
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            message,
                            textAlign: TextAlign.center,
                            style: messageStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 5.w, top: 10.h),
                  child: const Icon(
                    Icons.close_outlined,
                    color: Color(0xffc0c0c0),
                  ),
                )).prop(onTap: () {
              Navigator.pop(Get.context!);
            })
          ],
        ),
      ))
      ..dismissCallBack = () {
        currentDialogMessage = "";
        currentDialogShowing = false;
      }
      ..show();

    currentDialogMessage = message;
    currentDialogShowing = true;
  }

  static YYDialog showLoadingDialog(
    BuildContext context,
    String message, {
    String loadingMsg = "Loading...",
  }) {
    var totalHeight = MediaQuery.of(Get.context!).size.height;
    var totalWidth = MediaQuery.of(Get.context!).size.width;

    YYDialog yydialog = YYDialog();
    yydialog = YYDialog().build(context)
      ..width = totalWidth
      ..height = totalHeight
      ..borderRadius = 20.r
      ..backgroundColor = Colors.transparent
      ..widget(Container(
        // color: Colors.red,
        width: totalWidth,
        height: totalHeight,
        color: Colors.black12,
        child: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // 设置颜色为蓝色
            // backgroundColor: Colors.grey, // 设置背景颜色为灰色
          ),
        ),
      ))
      ..show();

    return yydialog;
  }

  static YYDialog showLoadingDialogWithCustomWidget(
    BuildContext context, {
    String? message = "",
    Widget? widgetContent,
    String loadingMsg = "Loading...",
    double totalHeight = 200,
    double totalWidth = 300,
  }) {
    totalHeight = MediaQuery.of(Get.context!).size.height;
    totalWidth = MediaQuery.of(Get.context!).size.width;

    YYDialog yydialog = YYDialog();

    Widget defaultWidget = Container(
      // color: Colors.red,
      width: totalWidth,
      height: totalHeight,
      color: Colors.black12,
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // 设置颜色为蓝色
          // backgroundColor: Colors.grey, // 设置背景颜色为灰色
        ),
      ),
    );

    yydialog = YYDialog().build(context)
      ..width = totalWidth
      ..height = totalHeight
      ..borderRadius = 20.r
      ..backgroundColor = Colors.transparent
      ..widget(widgetContent ?? defaultWidget)
      ..show();
    return yydialog;
  }

  static YYDialog showAnaLoadingDialog(
    BuildContext context,
    String message, {
    String loadingMsg = "Loading...",
  }) {
    var totalHeight = 392.h;
    var totalWidth = 345.w;

    YYDialog.init(context);

    YYDialog yydialog = YYDialog();
    yydialog = YYDialog().build(context)
      ..width = totalWidth
      ..height = totalHeight
      ..borderRadius = 20.r
      ..backgroundColor = Colors.transparent
      ..widget(Container(
        // color: Colors.red,
        width: totalWidth,
        height: totalHeight,
        decoration: const BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(colors: [
              Color(0xFFE9EEFA),
              Color(0xFFF7F8FB),
            ])),
        child: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // 设置颜色为蓝色
            // backgroundColor: Colors.grey, // 设置背景颜色为灰色
          ),
        ),
      ))
      ..show();

    return yydialog;
  }



  static YYDialog showCustomWelcomeDialog(BuildContext context, EdgeInsets margin, Widget content, Function() dismissCallback,
      {bool barrierDismissible = true, double? thisTotalWidth}) {
    // var thisTotalHeight = 386.h;
    YYDialog yydialog = YYDialog();
    yydialog = YYDialog().build(context)
      ..dismissCallBack = dismissCallback
      ..width = thisTotalWidth
      ..barrierDismissible = barrierDismissible
      ..height = thisTotalWidth
      ..borderRadius = 20.r
      ..margin = margin
      ..backgroundColor = Colors.transparent
      ..widget(Container(
        // padding: EdgeInsets.only(top: 24.h,bottom: 24.h),
        decoration: BoxDecoration(color: const Color(0xfffbfbfb), borderRadius: BorderRadius.circular(20.r)),
        child: content,
      ))
      ..show();

    return yydialog;
  }

  static YYDialog showCustomViewDialog(BuildContext context, Widget content, Function() dismissCallback,
      {bool barrierDismissible = true, double? thisTotalWidth}) {
    // var thisTotalHeight = 386.h;
    YYDialog yydialog = YYDialog();
    yydialog = YYDialog().build(context)
      ..dismissCallBack = dismissCallback
      ..width = thisTotalWidth
      ..barrierDismissible = barrierDismissible
      ..height = thisTotalWidth
      ..borderRadius = 20.r
      ..backgroundColor = Colors.transparent
      ..widget(Container(
        margin: EdgeInsets.only(left: 15.w, right: 15.w),
        padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
        decoration: BoxDecoration(color: const Color(0xfffbfbfb), borderRadius: BorderRadius.circular(20.r)),
        child: content,
      ))
      ..show();
    return yydialog;
  }

  static YYDialog showLearnMoreDialog(BuildContext context, Widget content, Function() dismissCallback, {bool barrierDismissible = true}) {
    // var thisTotalHeight = 386.h;
    // var thisTotalWidth = 345.w;
    YYDialog yydialog = YYDialog();
    yydialog = YYDialog().build(context)
      ..dismissCallBack = dismissCallback
      // ..width = thisTotalWidth
      ..barrierDismissible = barrierDismissible
      // ..height = thisTotalHeight
      ..backgroundColor = Colors.transparent
      ..widget(content)
      ..show();
    return yydialog;
  }

  static YYDialog showAutoDismissDialog(BuildContext context, Duration showTime, Widget content, Function() dismissCallback,
      {bool barrierDismissible = false}) {
    // var thisTotalHeight = 386.h;
    // var thisTotalWidth = 345.w;
    YYDialog yydialog = YYDialog();
    yydialog = YYDialog().build(context)
      ..dismissCallBack = dismissCallback

      // ..width = thisTotalWidth
      ..barrierDismissible = barrierDismissible
      // ..height = thisTotalHeight
      ..backgroundColor = Colors.transparent
      ..widget(content)
      ..show();

    Future.delayed(showTime, () {
      Navigator.of(context).pop();
    });
    return yydialog;
  }

  static YYDialog showEndSleepDialog(
    BuildContext context,
    String title,
    String content, {
    Function()? yesCallBack,
    Function()? continueCallBack,
    Function()? cancelCallBack,
  }) {
    YYDialog yydialog = DialogUtils.showCustomViewDialog(
        context,
        Container(
          width: MediaQuery.of(context).size.width / 6 * 5,
          // height: 310,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Image.asset(
                "images/icon_sleep_moon.png",
                width: 80.w,
                height: 80.w,
              ),
              Text(
                "${title}",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16.sp, color: const Color(0xff0b1250)),
              ),
              Text(
                "${content}",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14.sp, color: const Color(0xff0b1250)),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 15.h,
              ),
              FractionallySizedBox(
                widthFactor: 0.7,
                child: GFButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                    continueCallBack?.call();
                  },
                  shape: GFButtonShape.pills,
                  fullWidthButton: true,
                  borderSide: BorderSide(color: Color(0xff607AE3), width: 1.w),
                  size: 40,
                  child: Text(
                    "Mistake, continute tracking",
                    style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0xff607AE3)),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              FractionallySizedBox(
                widthFactor: 0.7,
                child: GFButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    yesCallBack?.call();
                  },
                  shape: GFButtonShape.pills,
                  size: 40,
                  child: Text(
                    "Accurate sleep, record it",
                    style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              FractionallySizedBox(
                widthFactor: 0.7,
                child: GFButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      cancelCallBack?.call();
                    },
                    color: Colors.transparent,
                    shape: GFButtonShape.pills,
                    size: 40,
                    child: Text(
                      "Delete this sleep session",
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0x960B1250), decoration: TextDecoration.underline),
                    )),
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ), () {
      debugPrint("----showCompleteDialog----");
    }, barrierDismissible: false);

    return yydialog;
  }

  ///弹出运动强度询问按钮
  ///currentDegree:Easy  Moderate  Hard
  static bool showAsk = false;

  static showHow2MeasureDialog(BuildContext context, Function(bool done) callBack) {
    Widget content = Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        // gradient: LinearGradient(colors: [
        //   Color(0xFFE9EEFA),
        //   Color(0xFFF7F8FB),
        // ])
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 32.w, right: 32.w),
            child: Column(
              children: [
                SizedBox(
                  height: 48.h,
                ),
                Text(
                  "How many is one cup?",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 18.sp, color: const Color(0xff20294C)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Image.asset(
                  "images/bg_mesure_cup.png",
                  width: 150.w,
                  height: 110.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Image.asset("images/bg_tabsp_cups.png"),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "1 cup is a standard measurement unit, equal to 250 grams in volume, 16 tablespoons.",
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff6F6C90),
                  ),
                ),
                SizedBox(
                  height: 48.h,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.h, right: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.clear).prop(onTap: () {
                  Navigator.of(context).pop();
                })
              ],
            ),
          )
        ],
      ),
    );
    DialogUtils.showCustomWelcomeDialog(context, EdgeInsets.only(left: 10.w, right: 10.w), content, () => null);
  }


  static YYDialog showAiDialog(BuildContext context, Widget content, Function() dismissCallback, {bool barrierDismissible = true, double? thisTotalWidth}) {
    // var thisTotalHeight = 386.h;
    YYDialog yydialog = YYDialog();
    yydialog = YYDialog().build(context)
      ..dismissCallBack = dismissCallback
      ..width = thisTotalWidth
      ..barrierDismissible = barrierDismissible
      ..height = thisTotalWidth
      // ..borderRadius = 10.r
      ..backgroundColor = Colors.transparent
      ..widget(Container(
        margin: EdgeInsets.only(left: 32.w, right: 32.w),
        // padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
        decoration: BoxDecoration(color: const Color(0xfffbfbfb), borderRadius: BorderRadius.circular(20.r)),
        child: content,
      ))
      ..show();
    return yydialog;
  }

  static void showConfirmDialog(
    BuildContext context,
    String message, {
    String cancelMsg = "取消",
    String confirmMsg = "确认",
    String title = "",
    required VoidCallback onTapConfirm,
    required VoidCallback onTapCancel,
  }) {
    title = (title.isEmpty ? "tips".tr : title);
    confirmMsg = "confirm".tr;
    cancelMsg = "cancel".tr;

    YYDialog yydialog;
    yydialog = YYDialog().build(context)
      ..width = totalWidth
      ..height = totalHeight
      ..borderRadius = 20.r
      ..backgroundColor = Colors.transparent
      ..widget(Container(
        // color: Colors.red,
        width: totalWidth,
        height: totalHeight,
        child: Stack(
          children: [
            //content
            Container(
              // color: Colors.green,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    child: Container(
                      color: Colors.white,
                      height: 180.h,
                      width: totalWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Image.asset(
                            "images/coffee.gif",
                            width: 80.w,
                            height: 60.h,
                          ),
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            message,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 5.w, top: 10.h),
                  child: const Icon(
                    Icons.close_outlined,
                    color: Color(0xffc0c0c0),
                  ),
                )).prop(onTap: () {
              Navigator.pop(Get.context!);
            })
          ],
        ),
      ))
      ..show();
  }

  static void showConfirmBasicDialog(
    BuildContext context,
    String message, {
    String cancelMsg = "取消",
    String confirmMsg = "确认",
    String title = "",
    TextStyle? messageStyle,
    required VoidCallback onTapConfirm,
    required VoidCallback onTapCancel,
  }) {
    title = (title.isEmpty ? "tips".tr : title);
    confirmMsg = "confirm".tr;
    cancelMsg = "cancel".tr;
    messageStyle = messageStyle ?? GoogleFonts.roboto(color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w400);

    YYDialog yydialog;
    yydialog = YYDialog().build(context)
      ..width = totalWidth
      ..height = totalHeight
      ..borderRadius = 20.r
      ..backgroundColor = Colors.transparent
      ..barrierDismissible = false
      ..widget(Container(
        // color: Colors.red,
        width: totalWidth,
        height: totalHeight,
        child: Stack(
          children: [
            //content
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                  child: Container(
                    color: Colors.white,
                    height: 240.h,
                    width: totalWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Icon(Icons.warning,color: Colors.red,),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          message,
                          textAlign: TextAlign.center,
                          style: messageStyle,
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 15.w, right: 15.w),
                          height: 60.h,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GFButton(
                                        onPressed: () {
                                          onTapCancel.call();
                                        },
                                        text: "No",
                                        color: Colors.grey,
                                        shape: GFButtonShape.pills,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GFButton(
                                        onPressed: () {
                                          onTapConfirm.call();
                                        },
                                        text: "Yes",
                                        shape: GFButtonShape.pills,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 5.w, top: 10.h),
                  child: const Icon(
                    Icons.close_outlined,
                    color: Color(0xffc0c0c0),
                  ).prop(onTap: () {
                    Navigator.pop(Get.context!);
                  }),
                ))
          ],
        ),
      ))
      ..show();
  }


  static comingSoon(BuildContext context) {
    GFToast.showToast("Coming soon!", context, toastPosition: GFToastPosition.CENTER);
  }

  static showRecordBloodFirstDialog(BuildContext context,Function()? addBloodCalBack) {
    Container container = Container(
      height: 190.h,
      margin: EdgeInsets.only(left: 15.w,right: 15.w,top: 5.h,bottom: 5.h),
      child: Column(
        children: [
          Text(
            "Data Needed",
            style: GoogleFonts.poppins(
              color: const Color(0xff333333),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          sb.h(15.h),
          Text(
            "Before starting the nutrition assessment, please add at least 1 blood pressure (BP) record in the GP Clinic. ",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 14.sp, color: const Color(0xff333333)),
          ),
          sb.h(30.h),
          Row(
            children: [
              sb.w(15.w),
              Expanded(
                  child: GFButton(
                text: "Cancel",
                fullWidthButton: true,
                color: Colors.white,
                borderSide: BorderSide(color: const Color(0xff607AE3),width: 1.w),
                shape: GFButtonShape.pills,
                textStyle: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff607AE3)
                ),
                size: 44.h,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )),
              sb.w(15.w),
              Expanded(
                  child: GFButton(
                text: "Add BP Data",
                fullWidthButton: true,
                color: const Color(0xff607AE3),
                shape: GFButtonShape.pills,
                size: 44.h,
                    textStyle: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                onPressed: () {
                  Navigator.of(context).pop();
                  addBloodCalBack?.call();
                },
              )),
              sb.w(15.w),
            ],
          ),

        ],
      ),
    );

    showCustomViewDialog(context, container, () {});
  }
}
