
class AudioState {
  final bool isPlaying;
  final String title;
  final String description;
  final Duration position;
  final Duration duration;

  const AudioState({
    this.isPlaying = false,
    this.title = '',
    this.description = '',
    this.position = Duration.zero,
    this.duration = Duration.zero,
  });

  AudioState copyWith({
    bool? isPlaying,
    String? title,
    String? description,
    Duration? position,
    Duration? duration,
  }) {
    return AudioState(
      isPlaying: isPlaying ?? this.isPlaying,
      title: title ?? this.title,
      description: description ?? this.description,
      position: position ?? this.position,
      duration: duration ?? this.duration,
    );
  }
}