import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

String TOKEN = "token";
class TokenController extends GetxController {
  static TokenController get to => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getToken();

  }


  String? token;


  setToken(String token) async {
    SharedPreferences _sp = await SharedPreferences.getInstance();

    token = token ;

    _sp.setString(TOKEN, token);
  }
  Future<String?> getToken() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();

    token = _sp.get(TOKEN) as String?;
    print("The token ${token}");
    return token;
  }


}
