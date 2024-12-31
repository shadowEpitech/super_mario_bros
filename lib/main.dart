import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:smbmario/components/constants/global.dart';
import 'package:smbmario/components/games/smb_game.dart';
import 'package:smbmario/components/constants/sprite_sheets.dart';

final SBMGame _sbmGame = SBMGame();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SpriteSheets.load();

  await FlameAudio.audioCache.loadAll(
    [
      Globals.jumpSmallSFX,
      Globals.pauseSFX,
      Globals.bumpSFX,
      Globals.powerUpAppearsSFX,
      Globals.breakBlockSFX,
    ],
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameWidget(game: _sbmGame),
    ),
  );
}

/*class SMBGame extends FlameGame {
  Level? level;
  @override
  FutureOr<void> onLoad() {
    loadLevel("level1.tmx");
  }

  /*void loadLevel(String levelName) {
    level?.removeFromParent();
    level = Level(levelName: levelName);
    add(level!);
  }*/
}*/
