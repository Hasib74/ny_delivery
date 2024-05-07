import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Functions/AppSnackBar.dart';

class ExceptionHandle {
  static exceptionHandle(Failure failure) {
    if (failure is ServerFailure) {
      AppSnackBar.errorSnackbar(msg: "Server Exception ");
    } else if (failure is NoConnectionFailure) {
      AppSnackBar.errorSnackbar(msg: "Please check your internet connection");
    }
  }

  static exceptionMessage(msg) {
    AppSnackBar.errorSnackbar(msg: "$msg");
  }
}
