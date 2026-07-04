import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_exam/core/assets/icons/app_icons.dart';
import 'package:project_exam/core/assets/images/app_images.dart';
import 'package:project_exam/core/constants/app_colors.dart';
import 'package:project_exam/core/routes/pages.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 357,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/futurama_back.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Image.asset(AppImages.futuramacover)],
                      ),
                    ],
                  ),
                  Positioned(
                    top: 300,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.bgShade,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: .center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 31),
                                child: Row(
                                  spacing: 8,

                                  children: [
                                    SvgPicture.asset(
                                      AppIcons.book,
                                      width: 24,
                                      height: 24,
                                      colorFilter: ColorFilter.mode(
                                        AppColors.white,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    Text(
                                      'Read Nexus',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 24,
                              color: AppColors.gray1,
                            ),
                            InkWell(
                              onTap: () {
                                context.push(Pages.audioplayerFull);

                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 31),
                                child: Row(
                                  spacing: 8,
                                  children: [
                                    SvgPicture.asset(
                                      AppIcons.headphone,
                                      width: 24,
                                      height: 24,
                                      colorFilter: ColorFilter.mode(
                                        AppColors.white,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    Text(
                                      'Play Nexus',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 16.0,
                top: 24,
                left: 16,
                bottom: 12,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        textAlign: TextAlign.left,
                        'Project Management for the\nUnofficial Proect Manager',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.bookmark_border_outlined,
                          color: AppColors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: .start,
                    children: [
                      Text(
                        textAlign: TextAlign.left,
                        'Kory Kogon, Suzette Blakemore, and James wood',
                        style: TextStyle(fontWeight: .w700, color: AppColors.gray1),
                      ),
                    ],
                  ),SizedBox(height: 4,),
                    Row(
                    mainAxisAlignment: .start,
                    children: [
                      Text(
                        textAlign: TextAlign.left,
                        'A FanklinConvey Title',
                        style: TextStyle(fontWeight: .w300, color: AppColors.gray1),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
