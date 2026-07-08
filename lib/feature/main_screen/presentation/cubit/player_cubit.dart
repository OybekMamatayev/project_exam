import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart' hide PlayerState;
import 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  static const String defaultAudioUrl =
      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';
  static const String defaultTitle = 'Futurama';
  static const String defaultAuthor =
      'Managers who want to create positive work environments...';
  static const String defaultCoverImage = 'https://via.placeholder.com/400x400';

  PlayerCubit() : super(const PlayerState()) {
    _audioPlayer.positionStream.listen((pos) {
      emit(state.copyWith(position: pos));
    });

    _audioPlayer.durationStream.listen((dur) {
      if (dur != null) emit(state.copyWith(duration: dur));
    });

    _audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.playing) {
        emit(state.copyWith(status: PlayerStatus.playing));
      } else if (state.status != PlayerStatus.loading) {
        emit(state.copyWith(status: PlayerStatus.paused));
      }
    });
  }

  Future<void> ensurePlaying() async {
    if (!state.hasTrack) {
      await playTrack(
        audioUrl: defaultAudioUrl,
        title: defaultTitle,
        author: defaultAuthor,
        coverImage: defaultCoverImage,
        autoPlay: false
      );
    } else {
      togglePlay();
    }
  }

  Future<void> playTrack({
    required String audioUrl,
    required String title,
    required String author,
    required String coverImage,
    bool autoPlay = true,
  }) async {
    if (state.audioUrl == audioUrl && state.hasTrack) {
      if (autoPlay) togglePlay();
      return;
    }

    try {
      emit(
        state.copyWith(
          status: PlayerStatus.loading,
          audioUrl: audioUrl,
          title: title,
          author: author,
          coverImage: coverImage,
          position: Duration.zero,
        ),
      );
      await _audioPlayer.setUrl(audioUrl);

      if (autoPlay) {
        _audioPlayer.play();
      } else {
        _audioPlayer.pause();
      }
    } catch (e) {
      emit(state.copyWith(status: PlayerStatus.error));
    }
  }

  void togglePlay() {
    if (_audioPlayer.playing) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  void seekBy(int seconds) {
    final newPosition = state.position + Duration(seconds: seconds);
    _audioPlayer.seek(newPosition);
  }

  void changeSpeed() {
    double newSpeed;
    if (state.speed == 1.0) {
      newSpeed = 1.25;
    } else if (state.speed == 1.25) {
      newSpeed = 1.5;
    } else if (state.speed == 1.5) {
      newSpeed = 2.0;
    } else if (state.speed == 2.0) {
      newSpeed = 0.75;
    } else {
      newSpeed = 1.0;
    }
    _audioPlayer.setSpeed(newSpeed);
    emit(state.copyWith(speed: newSpeed));
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}
