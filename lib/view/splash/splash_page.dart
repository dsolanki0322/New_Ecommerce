
import 'package:fakestore/controller/splash/splash_controller.dart';
import 'package:fakestore/model/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../model/utils.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (_) {
        return Scaffold(
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    child: Container(
                      alignment: Alignment.center,
                    )),
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 70),
                      child: Image.asset(
                        Utils().imageLogoAsset,
                        width: Get.width*0.45,
                        height: Get.width*0.45,
                      ),),
                ]),
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Container(
                                alignment: Alignment.center,
                              )),
                          Expanded(child: Container()),
                          //Expanded(child: Container()),

                          Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: LoadingAnimationWidget.staggeredDotsWave(
                                  // leftDotColor: Color(0xFFB28748),
                                  //rightDotColor: Color(0xFFE3CEAE),
                                  size: 50,
                                  color: EColors.green,
                                ),
                              ))
                        ])),
              ]),
          // body: Center(
          //   child: Image.asset(
          //     Utils().imageLogoAsset,
          //     width: Get.width*0.45,
          //     height: Get.width*0.45,
          //   ),
          // ),
        );
      },
    );
  }
}
