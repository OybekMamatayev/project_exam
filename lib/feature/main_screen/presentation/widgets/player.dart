import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_exam/core/assets/images/app_images.dart';
import 'package:project_exam/core/constants/app_colors.dart';
import 'package:project_exam/core/routes/pages.dart';
import 'package:project_exam/feature/main_screen/presentation/cubit/audio_cubit.dart';
import 'package:project_exam/feature/main_screen/presentation/cubit/audio_state.dart';
import 'package:project_exam/feature/main_screen/presentation/widgets/player_button.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioCubit, AudioState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context.go(Pages.detailscreen);
          },
          child: Container(
            height: 82,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.bgDark,
              border: Border(
                top: BorderSide(color: AppColors.accentGreen, width: 0.5),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.futuramasmall),
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.title.isEmpty
                            ? 'Continue Listening'
                            : state.title,
                        style: const TextStyle(
                          color: AppColors.accentGreen,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.description.isEmpty
                            ? 'Managers who want to create positive work environments...'
                            : state.description,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                          height: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 16),

                PlayerButton(
                  icon: state.isPlaying
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded,
                  onTap: () {
                    final cubit = context.read<AudioCubit>();
                    if (state.title.isEmpty) {
                      cubit.playAsset('audio/futurama.mp3');
                    } else {
                      cubit.togglePlay();
                    }
                  },
                ),

                const SizedBox(width: 12),

                PlayerButton(
                  icon: Icons.fast_forward_rounded,
                  onTap: () => context.read<AudioCubit>().next(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
