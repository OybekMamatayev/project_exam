import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_exam/core/assets/icons/app_icons.dart';
import 'package:project_exam/core/assets/images/app_images.dart';
import 'package:project_exam/core/constants/app_colors.dart';
import 'package:project_exam/feature/home/presentation/widgets/reading_card.dart';
import 'package:project_exam/feature/main_screen/presentation/cubit/player_cubit.dart';
import 'package:project_exam/feature/main_screen/presentation/cubit/player_state.dart';

class AudioPayerScreen extends StatefulWidget {
  const AudioPayerScreen({super.key});

  @override
  State<AudioPayerScreen> createState() => _AudioPayerScreenState();
}

class _AudioPayerScreenState extends State<AudioPayerScreen> {
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<PlayerCubit>().ensurePlaying();
  });
}

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString();
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1.0,
      minChildSize: 0.5,
      maxChildSize: 1.0,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(color: AppColors.bgDark),
          child: SafeArea(
            child: BlocBuilder<PlayerCubit, PlayerState>(
              builder: (context, state) {
                final cubit = context.read<PlayerCubit>();
                final remaining = state.duration - state.position;

                return SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.white,
                              size: 28,
                            ),
                            onPressed: () => Navigator.pop(context),
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
                      const SizedBox(height: 8),
                      Image.asset(
                        AppImages.backaudio,
                        height: 357,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          state.title,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          state.author,
                          style: const TextStyle(
                            color: AppColors.gray2,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      if (state.status == PlayerStatus.loading)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.accentGreen,
                            ),
                          ),
                        )
                      else ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 3,
                              thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 6,
                              ),
                              overlayShape: SliderComponentShape.noOverlay,
                              activeTrackColor: AppColors.accentGreen,
                              inactiveTrackColor: AppColors.gray3,
                              thumbColor: AppColors.accentGreen,
                            ),
                            child: Slider(
                              value: state.position.inMilliseconds
                                  .toDouble()
                                  .clamp(
                                    0,
                                    state.duration.inMilliseconds.toDouble(),
                                  ),
                              max: state.duration.inMilliseconds > 0
                                  ? state.duration.inMilliseconds.toDouble()
                                  : 1,
                              onChanged: (value) => cubit.seek(
                                Duration(milliseconds: value.toInt()),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _formatDuration(state.position),
                                style: const TextStyle(
                                  color: AppColors.gray2,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '-${_formatDuration(remaining)}',
                                style: const TextStyle(
                                  color: AppColors.gray2,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            children: [
                              IconButton(
                                icon: SvgPicture.asset(
                                  AppIcons.back,
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.white,
                                    BlendMode.srcIn,
                                  ),
                                  width: 20,
                                  height: 20,
                                ),
                                onPressed: () {},
                              ),

                              const Spacer(),
                              SizedBox(
                                height: 24,
                                width: 24,
                                child: SvgPicture.asset(
                                  AppIcons.skipBack,
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.white,
                                    BlendMode.srcIn,
                                  ),
                                  width: 24,
                                  height: 24,
                                ),
                              ),

                              const Spacer(),
                              InkWell(
                                onTap: cubit.togglePlay,
                                child: Container(
                                  width: 64,
                                  height: 64,
                                  decoration: const BoxDecoration(
                                    color: AppColors.accentGreen,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 17,
                                    ),
                                    child: SvgPicture.asset(
                                      state.isPlaying
                                          ? AppIcons.play
                                          : AppIcons.pause,
                                      colorFilter: const ColorFilter.mode(
                                        AppColors.bgDark,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: SvgPicture.asset(
                                  AppIcons.skipForward,
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.white,
                                    BlendMode.srcIn,
                                  ),
                                  width: 24,
                                  height: 24,
                                ),
                                onPressed: () => cubit.seekBy(10),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: SvgPicture.asset(
                                  AppIcons.skip,
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.white,
                                    BlendMode.srcIn,
                                  ),
                                  width: 24,
                                  height: 24,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.nightlight_round,
                                  color: AppColors.gray2,
                                  size: 22,
                                ),
                                onPressed: () {},
                              ),
                              GestureDetector(
                                onTap: cubit.changeSpeed,
                                child: Text(
                                  '${state.speed}x',
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: const ReadingCard(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
