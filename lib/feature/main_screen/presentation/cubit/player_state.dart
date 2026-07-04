
import 'package:equatable/equatable.dart';

enum PlayerStatus { initial, loading, playing, paused, error }

class PlayerState extends Equatable {
  final PlayerStatus status;
  final String? audioUrl;
  final String title;
  final String author;
  final String coverImage;
  final Duration position;
  final Duration duration;
  final double speed;

  const PlayerState({
    this.status = PlayerStatus.initial,
    this.audioUrl,
    this.title = '',
    this.author = '',
    this.coverImage = '',
    this.position = Duration.zero,
    this.duration = Duration.zero,
    this.speed = 1.0,
  });

  bool get isPlaying => status == PlayerStatus.playing;
  bool get hasTrack => audioUrl != null;

  PlayerState copyWith({
    PlayerStatus? status,
    String? audioUrl,
    String? title,
    String? author,
    String? coverImage,
    Duration? position,
    Duration? duration,
    double? speed,
  }) {
    return PlayerState(
      status: status ?? this.status,
      audioUrl: audioUrl ?? this.audioUrl,
      title: title ?? this.title,
      author: author ?? this.author,
      coverImage: coverImage ?? this.coverImage,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      speed: speed ?? this.speed,
    );
  }

  @override
  List<Object?> get props => [
    status,
    audioUrl,
    title,
    author,
    coverImage,
    position,
    duration,
    speed,
  ];
}