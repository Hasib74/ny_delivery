import 'package:dartz/dartz.dart';

import '../../../../Core/DataSource/Remote/ApiClient.dart';
import '../../../../Core/DataSource/Remote/ApiUrls.dart';
import '../../../../Core/Error/failures.dart';

class DeliveredListRepository{



  Future<Either<dynamic, Failure>> getDeliveredList() async {
    try {
/*      if (await App.isConnected) {*/
        dynamic response = await ApiClient.Request(
          // url: ApiUrls.pendingOrder,
            url: ApiUrls.deliveryHistory,
            enableHeader: true,
            method: Method.GET);
        print("Pending Order response......... ${response}");
        return Left(response);
     /* } else {
        print("No Netork..............please connect with network");
        return Right(NoConnectionFailure());
      }*/
    } catch (err) {
      print("Error : ${err}");
      return Right(ServerFailure());
    }
  }


}