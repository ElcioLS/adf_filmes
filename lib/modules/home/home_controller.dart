import 'package:get/get.dart';

import '../../services/login/login_service.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;
  static const INDEX_PAGE_EXIT = 2;

  final LoginService _loginService;

  HomeController({required LoginService loginService})
      : _loginService = loginService;

  final _pages = ['/movies', '/favorites'];

  final _pageIndex = 0.obs;

  int get pageIndex => _pageIndex.value;

  void goToPage(int page) {
    _pageIndex(page);
    if (page == INDEX_PAGE_EXIT) {
      _loginService.logout();
    } else {
      Get.offNamed(_pages[page], id: NAVIGATOR_KEY);
    }
  }
}

//acima código melhorado
// class HomeController extends GetxController {
//   final _pageIndex = 0.obs;

//   int get pageIndex => _pageIndex.value;

//   void goToPage(int page) {
//     _pageIndex(page);
//     if (page == 1) {
//       Get.offNamed('/favorites', id: 1);
//     } else if (page == 0) {
//       Get.offNamed('/movies', id: 1);
//     }
//   }
// }
