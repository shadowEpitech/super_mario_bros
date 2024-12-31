import 'dart:async';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:smbmario/components/constants/global.dart';
import 'package:smbmario/components/levels/level.dart';
import 'package:smbmario/components/levels/level_option.dart';

class SBMGame extends FlameGame
    with HasCollisionDetection, HasKeyboardHandlerComponents {
  late CameraComponent cameraComponent;
  @override
  final World world = World();
  Level? _levelComponent;

  @override
  FutureOr<void> onLoad() async {
    /*TiledComponent map = await TiledComponent.load(
      Globals.lv_1_1,
      Vector2.all(Globals.tileSize),
    );*/

    //world.add(map);

    cameraComponent = CameraComponent(world: world)
      ..viewport.size = Vector2(450, 50)
      ..viewport.position = Vector2(500, 0)
      ..viewfinder.visibleGameSize = Vector2(480, 150)
      ..viewfinder.position = Vector2(0, 0)
      ..viewfinder.anchor = Anchor.topLeft;

    addAll([world, cameraComponent]);

    loadLevel(LevelOption.lv_1_1);

    return super.onLoad();
  }

  void loadLevel(LevelOption option) {
    _levelComponent?.removeFromParent();
    _levelComponent = Level(option);
    add(_levelComponent!);
  }
}
