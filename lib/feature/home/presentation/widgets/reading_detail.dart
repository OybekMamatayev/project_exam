import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_exam/core/constants/app_colors.dart';
import 'package:project_exam/core/routes/pages.dart';

class ReadingDetail extends StatelessWidget {
  final String title;
  final String content;

  const ReadingDetail({
    super.key,
    this.title =
        'What is in it for me? Learn how to become an effecive '
        'unofficial project manager',
    this.content =
        'Far far away, behind the word mountains, far from the countries '
        'Vokalia and Consonantia, there live the blind texts. Separated '
        'they live in Bookmarksgrove right at the coast of the Semantics, '
        'a large language ocean. A small river named Duden flows by their '
        'place and supplies it with the necessary regelialia. It is a '
        'paradisematic country, in which roasted parts of sentences fly '
        'into your mouth.\n\n'
        'The Big Oxmox advised her not to do so, because there were '
        'thousands of bad Commas, wild Question Marks and devious '
        'Semikoli, but the Little Blind Text didn\'t listen.\n\n'
        'Little Blind Text didn\'t listen. She packed her seven versalia, '
        'put her initial into the belt and made herself on the way.\n\n'
        'Bookmarksgrove, the headline of Alphabet Village and the '
        'subline of her own road, the Line Lane. Pityful a rethoric '
        'question ran over her cheek, then',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.white,
                      size: 26,
                    ),
                    onPressed: () => context.pop(),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: AppColors.accentGreen,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.play_arrow,
                            color: AppColors.bgDark,
                            size: 18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        icon: const Icon(
                          Icons.headphones,
                          color: AppColors.white,
                          size: 22,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.more_vert,
                          color: AppColors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        content,
                        style: const TextStyle(
                          color: AppColors.gray1,
                          fontSize: 15,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
