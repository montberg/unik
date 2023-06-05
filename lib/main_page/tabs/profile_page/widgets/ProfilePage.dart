import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../../auth_page/User.dart';
import '../../../../global_widgets/button.dart';
import '../../../../global_widgets/userInfo.dart';
import '../controllers/goto_profile_editing.dart';
import '../controllers/goto_saved.dart';
import '../controllers/logout_button_controller.dart';


class ProfilePageWidget extends StatelessWidget {
  final User user;

  const ProfilePageWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gotoProfileEditing = GotoProfileEditing();
    final gotoSaved = GotoSaved();
    final gotoSettings = GotoSettings();
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: UserInfo(user: user),
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
                      Icons.edit,
                      size: 40,
                    ),
                    child: Text("Редактировать профиль", style: GoogleFonts.montserrat(fontWeight: FontWeight.w800)),
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
                    child: Text("Избранное", style: GoogleFonts.montserrat(fontWeight: FontWeight.w800)),
                    onPressed: () => gotoSaved.execute(), isChevronBlack: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Button(
                      icon: const Icon(
                        Icons.logout_rounded,
                        size: 40,
                      ),
                    child: Text("Выйти из аккаунта", style: GoogleFonts.montserrat(fontWeight: FontWeight.w800)),
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
