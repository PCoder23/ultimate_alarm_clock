import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ultimate_alarm_clock/app/modules/home/controllers/home_controller.dart';
import 'package:ultimate_alarm_clock/app/modules/settings/controllers/theme_controller.dart';

import 'package:ultimate_alarm_clock/app/modules/settings/views/enable_24Hour_format.dart';

import 'package:ultimate_alarm_clock/app/modules/settings/views/enable_haptic_feedback.dart';
import 'package:ultimate_alarm_clock/app/modules/settings/views/enable_sorted_alarm_list.dart';
import 'package:ultimate_alarm_clock/app/modules/settings/views/language_menu.dart';
import 'package:ultimate_alarm_clock/app/modules/settings/views/theme_value_tile.dart';
import 'package:ultimate_alarm_clock/app/modules/settings/views/weather_api.dart';
import 'package:ultimate_alarm_clock/app/routes/app_pages.dart';
import 'package:ultimate_alarm_clock/app/utils/utils.dart';
import 'package:ultimate_alarm_clock/app/utils/constants.dart';
import '../controllers/settings_controller.dart';
import 'google_sign_in.dart';

class SettingsView extends GetView<SettingsController> {
  SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = Get.width;
    var height = Get.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings'.tr,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: controller.themeController.isLightMode.value
                    ? kLightPrimaryTextColor
                    : kprimaryTextColor,
                fontWeight: FontWeight.w500,
              ),
        ),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.adaptive.arrow_back,
            color: controller.themeController.isLightMode.value
                ? kLightPrimaryTextColor
                : kprimaryTextColor,
          ),
          onPressed: () {
            Utils.hapticFeedback();
            Get.offNamed(Routes.BOTTOM_NAVIGATION_BAR);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Column(
              children: [
                WeatherApi(
                  controller: controller,
                  width: width,
                  height: height,
                  themeController: controller.themeController,
                ),
                const SizedBox(
                  height: 20,
                ),
                GoogleSignIn(
                  controller: controller,
                  width: width,
                  height: height,
                  themeController: controller.themeController,
                ),
                const SizedBox(
                  height: 20,
                ),
                EnableHapticFeedback(
                  height: height,
                  width: width,
                  controller: controller,
                  themeController: controller.themeController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Enable24HourFormat(
                  height: height,
                  width: width,
                  controller: controller,
                  themeController: controller.themeController,
                ),
                const SizedBox(
                  height: 20,
                ),
                EnableSortedAlarmList(
                  controller: controller,
                  height: height,
                  width: width,
                  themeController: controller.themeController,
                ),
                const SizedBox(
                  height: 20,
                ),
                ThemeValueTile(
                  controller: controller,
                  height: height,
                  width: width,
                  themeController: controller.themeController,
                ),
                const SizedBox(
                  height: 20,
                ),
                LanguageMenu(
                  controller: controller,
                  height: height,
                  width: width,
                  themeController: controller.themeController,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
