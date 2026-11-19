import 'package:flipkart_clone/core/routes/app_routes.dart';
import 'package:flipkart_clone/model/home_model.dart';
import 'package:flipkart_clone/services/api_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ApiService _apiService = ApiService();

  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  Rxn<HomeModel> homemodel = Rxn<HomeModel>();

  RxInt selectedCategoryIndex = 0.obs;

  RxInt selectedMenu = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchHomeData();
  }

  Future<void> fetchHomeData() async {
    try {
      isLoading.value = true;
      errorMessage.value = "";
      final response = await _apiService.getHomes();

      homemodel.value = HomeModel.fromJson(response);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void selectedCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  void changeMenu(int index) {
    selectedMenu.value = index;

    switch (index) {
      case 0:
        Get.toNamed(AppRoutes.home);
        break;
      case 1:
        Get.toNamed(AppRoutes.play);
        break;
      case 2:
        Get.toNamed(AppRoutes.category);
        break;

      case 3:
        Get.toNamed(AppRoutes.account);
        break;
      case 4:
        Get.toNamed(AppRoutes.cart);
        break;
    }
  }
}
