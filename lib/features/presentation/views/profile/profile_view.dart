import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/app_routes.dart';
import '../../provider/profile/profile_provider.dart';
import 'widgets/favorites_card.dart';
import 'widgets/lang_card.dart';
import 'widgets/profile_pic.dart';
import 'widgets/theme_card.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, profileProvider, child) {
        return Scaffold(
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => context.push(AppRoutes.editProfile),
                child: const ProfilePic(
                  image:
                      "https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg",
                ),
              ),
              Text(!profileProvider.isLoading
                  ? profileProvider.userEntity!.userName!
                  : ""),
              Text(!profileProvider.isLoading
                  ? profileProvider.userEntity!.email!
                  : ""),
              FavoritesCard(userEntity: profileProvider.userEntity!),
              const ThemeCard(),
              const LangCard(),
              ElevatedButton(
                onPressed: () =>
                    profileProvider.logOut(context, msg: "Logging out...."),
                child: const Text("Log Out"),
              ),
            ],
          )),
        );
      },
    );
  }
}
