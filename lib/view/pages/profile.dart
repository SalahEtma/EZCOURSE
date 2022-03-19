import 'package:course_app/view/components/constants.dart';
import 'package:course_app/view/components/custom_container.dart';
import 'package:course_app/view/components/icon_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  static final languageKey = 'key-language';

  MyPaddings myPaddings = MyPaddings();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
            centerTitle: true,
          ),
          body: SettingsList(
            contentPadding: EdgeInsets.symmetric(
                vertical: myPaddings.verticalPadding,
                horizontal: myPaddings.sidePadding),
            sections: [
              SettingsSection(
                title: 'Settings',
                tiles: [
                  SettingsTile(
                    leading: IconBuilder(
                      backgroundColor: Colors.blueAccent,
                      icon: Icon(
                        Icons.language_rounded,
                        color: Colors.white,
                      ),
                    ),
                    title: 'Language',
                  ),
                  SettingsTile(
                    leading: IconBuilder(
                      backgroundColor: Colors.redAccent,
                      icon: Icon(
                        Icons.logout_rounded,
                        color: Colors.white,
                      ),
                    ),
                    title: 'Logout',
                  )
                ],
              )
            ],
          )),
    );
  }
}
