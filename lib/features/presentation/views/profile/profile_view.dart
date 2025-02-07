import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/app_routes.dart';
import '../../provider/profile/profile_provider.dart';
import 'widgets/about_us_card.dart';
import 'widgets/address_card.dart';
import 'widgets/contact_us_card.dart';
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 35),
              child: Center(
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
                  const SizedBox(height: 10),
                  const FavoritesCard(),
                  const AddressCard(),
                  const Divider(thickness: 1.5),
                  const ThemeCard(),
                  const LangCard(),
                  const Divider(thickness: 1.5),
                  const AboutUsCard(),
                  const ContactUsCard(),
                  ElevatedButton(
                    onPressed: () =>
                        profileProvider.logOut(context, msg: "Logging out...."),
                    child: const Text("Log Out"),
                  ),
                ],
              )),
            ),
          ),
        );
      },
    );
  }
}
