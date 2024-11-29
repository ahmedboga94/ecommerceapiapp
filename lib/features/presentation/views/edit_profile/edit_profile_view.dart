import 'package:ecommerceapiapp/features/presentation/provider/profile/profile_provider.dart';
import 'package:flutter/material.dart';

import '../profile/widgets/profile_pic.dart';

class EditProfileView extends StatelessWidget {
  final ProfileProvider? profileProvider;
  const EditProfileView({super.key, this.profileProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ProfilePic(
              picSize: 200,
              image:
                  "https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg",
            ),
          ],
        ),
      ),
    );
  }
}
