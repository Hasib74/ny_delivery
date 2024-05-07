import 'package:get/get.dart';

class AppLoadingController extends GetxController {
  bool? isLoading = false;

  @override
  void onInit() {
    isLoading = false;
    update();
    super.onInit();
  }

  setLoading({bool? isLoading}) {
    this.isLoading = isLoading;
    update();
  }
}
