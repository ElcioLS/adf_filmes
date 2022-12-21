import 'package:adf_filmes/application/ui/filmes_app_icons_icons.dart';
import 'package:adf_filmes/application/ui/theme_extensios.dart';
import 'package:adf_filmes/modules/favorites/favorites_bindings.dart';
import 'package:adf_filmes/modules/movies/movies_bindings.dart';
import 'package:adf_filmes/modules/movies/movies_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../favorites/favorites_page.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: context.themeRed,
          unselectedItemColor: Colors.grey,
          onTap: controller.goToPage,
          currentIndex: controller.pageIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Filmes'),
            BottomNavigationBarItem(
                icon: Icon(FilmesAppIcons.heart_empty), label: 'Favoritos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout_outlined), label: 'Sair'),
          ],
        );
      }),
      body: Navigator(
        initialRoute: '/movies',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: (settings) {
          if (settings.name == '/movies') {
            return GetPageRoute(
              settings: settings,
              page: () => const MoviesPage(),
              binding: MoviesBindings(),
            );
          }
          if (settings.name == '/favorites') {
            return GetPageRoute(
              settings: settings,
              page: () => const FavoritesPage(),
              binding: FavoritesBindings(),
            );
          }
          return null;
        },
      ),
    );
  }
}
