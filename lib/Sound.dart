import 'package:assets_audio_player/assets_audio_player.dart';

void playSound(int soundNumber) {
  final assetsAudioPlayer = AssetsAudioPlayer();

  assetsAudioPlayer.open(
    Audio("note$soundNumber.wav"),
  );}

