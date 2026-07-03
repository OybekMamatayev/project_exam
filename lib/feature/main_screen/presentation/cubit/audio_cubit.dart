import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  final AudioPlayer _player = AudioPlayer();

  AudioCubit() : super(const AudioState()) {
    _player.positionStream.listen((pos) {
      emit(state.copyWith(position: pos));
    });

    _player.durationStream.listen((dur) {
      if (dur != null) emit(state.copyWith(duration: dur));
    });

    _player.playingStream.listen((playing) {
      emit(state.copyWith(isPlaying: playing));
    });
  }

  Future<void> play(
    String url, {
    String title = '',
    String description = '',
  }) async {
    await _player.setUrl(url);
    await _player.play();
    emit(
      state.copyWith(isPlaying: true, title: title, description: description),
    );
  }

  Future<void> playAsset(
    String assetPath, {
    String title = '',
    String description = '',
  }) async {
    await _player.setAsset(assetPath);
    await _player.play();
    emit(
      state.copyWith(isPlaying: true, title: title, description: description),
    );
  }

  Future<void> togglePlay() async {
    if (_player.playing) {
      await _player.pause();
    } else {
      await _player.play();
    }
  }

  Future<void> next() async => await _player.seekToNext();

  Future<void> previous() async => await _player.seekToPrevious();

  Future<void> stop() async {
    await _player.stop();
    emit(state.copyWith(isPlaying: false));
  }

  @override
  Future<void> close() {
    _player.dispose();
    return super.close();
  }
}
