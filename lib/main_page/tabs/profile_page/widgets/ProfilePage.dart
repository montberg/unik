import 'package:flutter/material.dart';


import '../../../../global_widgets/button.dart';
import '../../../../global_widgets/userInfo.dart';
import '../controllers/goto_profile_editing.dart';
import '../controllers/goto_saved.dart';
import '../controllers/goto_settings.dart';


class ProfilePageWidget extends StatelessWidget {
  const ProfilePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gotoProfileEditing = GotoProfileEditing();
    final gotoSaved = GotoSaved();
    final gotoSettings = GotoSettings();
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 150,
            child: UserInfo(),
          ),
          const Divider(
            thickness: 1,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 50),
                  Button(
                    icon: const Icon(
                      Icons.account_circle_rounded,
                      size: 40,
                    ),
                    child: Text("Редактировать профиль"),
                    onPressed: () => gotoProfileEditing.execute(),
                    isChevronBlack: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Button(
                    icon: const Icon(
                      Icons.star,
                      size: 40,
                    ),
                    child: Text("Избранное"),
                    onPressed: () => gotoSaved.execute(), isChevronBlack: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Button(
                      icon: const Icon(
                        Icons.settings,
                        size: 40,
                      ),
                    child: Text("Настройки"),
                    onPressed: () => gotoSettings.execute(), isChevronBlack: true,),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
