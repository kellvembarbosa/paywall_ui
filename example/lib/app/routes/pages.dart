import 'package:get/get.dart';

import '../modules/home/binding.dart';
import '../modules/home/view.dart';
import '../modules/paywall/view.dart';
part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.PAYWALL,
      page: () => PaywallPage(),
    ),
  ];
}
