import 'package:adf_filmes/application/auth/auth_service.dart';
import 'package:adf_filmes/repositories/login/login_repository.dart';
import 'package:adf_filmes/repositories/login/login_repository_impl.dart';
import 'package:adf_filmes/services/login/login_service.dart';
import 'package:adf_filmes/services/login/login_service_impl.dart';
import 'package:get/get.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(), fenix: true);
    Get.lazyPut<LoginService>(
        () => LoginServiceImpl(loginRepository: Get.find()),
        fenix: true);
    Get.put(AuthService()).init();
  }
}
