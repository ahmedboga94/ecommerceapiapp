import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';

class ProfilePic extends StatelessWidget {
  final String image;
  final IconData? iconData;
  final double picSize;
  final bool isEdit;
  final Function()? onPressed;
  const ProfilePic(
      {super.key,
      required this.image,
      this.onPressed,
      this.iconData,
      this.picSize = 150,
      this.isEdit = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: picSize,
        width: picSize,
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primeColor,
              child: ClipOval(
                child: CircleAvatar(
                    radius: picSize / 2.08,
                    // backgroundColor: context.color.scaffold,
                    child: CachedNetworkImage(
                        width: picSize / 0.08,
                        height: picSize / 0.08,
                        imageUrl: image,
                        placeholder: (context, url) => const SizedBox(),
                        errorWidget: (context, url, error) => const SizedBox(),
                        fit: BoxFit.cover)),
              ),
            ),
            isEdit
                ? Positioned(
                    bottom: 0,
                    right: -9,
                    child: SizedBox(
                      height: picSize / 3.1,
                      width: picSize / 3.1,
                      child: ElevatedButton(
                          onPressed: onPressed,
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              side:
                                  const BorderSide(color: AppColors.primeColor),
                              shape: const CircleBorder()),
                          child: Icon(iconData, size: picSize / 5.5)),
                    ))
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
