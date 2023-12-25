import 'package:bloc_app/common/entities/entities.dart';
import 'package:bloc_app/common/utils/http_utils.dart';

class UserAPI {
  static login({LoginRequestEntity? loginRequestEntity}) async {
    var response = await HttpUtils().post(
      "api/login/",
      queryParameters: loginRequestEntity?.toJson(),
    );
    return UserLoginResponseEntity.fromJson(response);
    // print(response.toString());
  }
}
