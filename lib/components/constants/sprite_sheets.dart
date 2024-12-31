import 'dart:async';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:smbmario/components/constants/global.dart';

class SpriteSheets {
  static late SpriteSheet itemBlockSpriteSheet;
  static late SpriteSheet goombaSpriteSheet;

  static FutureOr<void> load() async {
    // Item blocks Sprite Sheet
    final itemBlocksSpriteSheetImage = await Flame.images.load(
      Globals.blockSpriteSheet,
    );
    itemBlockSpriteSheet = SpriteSheet.fromColumnsAndRows(
      image: itemBlocksSpriteSheetImage,
      columns: 28,
      rows: 16,
    );

    final goombaSpriteSheetImage = await Flame.images.load(
      Globals.goombaSpriteSheet,
    );
    goombaSpriteSheet = SpriteSheet.fromColumnsAndRows(
      image: goombaSpriteSheetImage,
      columns: 3,
      rows: 1,
    );
  }
}
