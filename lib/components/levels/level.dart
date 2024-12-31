/*import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class Level extends Component {
  Level({required this.levelName});

  final String levelName;

  @override
  FutureOr<void> onLoad() async {
    final map = await TiledComponent.load(levelName, Vector2.all(16));
    add(map);
    return super.onLoad();
  }
}*/

import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:smbmario/components/constants/global.dart';
import 'package:smbmario/components/games/smb_game.dart';
import 'package:smbmario/components/levels/level_option.dart';

class Level extends Component with HasGameRef<SBMGame> {
  final LevelOption option;

  late Rectangle _levelBounds;

  Level(this.option) : super();

  @override
  FutureOr<void> onLoad() async {
    TiledComponent level = await TiledComponent.load(
      Globals.lv_1_1,
      Vector2.all(Globals.tileSize),
    );

    gameRef.world.add(level);

    _levelBounds = Rectangle.fromPoints(
      Vector2(0, 0),
      Vector2(level.tileMap.map.width.toDouble(),
              level.tileMap.map.height.toDouble()) *
          Globals.tileSize,
    );

    return super.onLoad();
  }
}
