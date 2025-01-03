import 'package:smbmario/components/constants/global.dart';

enum LevelOption {
  lv_1_1(Globals.lv_1_1, '1-1');

  const LevelOption(
    this.pathName,
    this.name,
  );

  final String pathName;
  final String name;
}
