import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_drawer_example/app/app_module.dart';
import 'package:modular_drawer_example/app/modules/other/other_module.dart';

void main() {
  initModules([AppModule(), OtherModule()]);

  test('Get Controller', () {
    final controller = Modular.get<Controller>();
    controller.printText();
  });
}
