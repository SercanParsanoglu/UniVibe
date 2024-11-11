import 'package:uni_social/feature/base/base_service.dart';
import 'package:uni_social/feature/model/sign_up/sign_up_req_model.dart';
import 'package:uni_social/feature/model/user_model.dart';
import 'package:uni_social/feature/provider/cache_user_provider.dart';

import '../../locator.dart';

class FakeService implements IService {
  @override
  Future<BaseResponseModel> requestForFriends() async {
    await Future.delayed(const Duration(seconds: 5));
    return BaseResponseModel(status: 0, data: "Data", message: "Successfull");
  }

  @override
  Future<BaseResponseModel> signUp(SignUpReqModel signUpReqModel) async {
    await Future.delayed(const Duration(seconds: 3));
 
    return BaseResponseModel(
        status: 0,
        data: "Data",
        message: '{"mail": "user@example.com", "password": "userPassword123"}');
  }

  @override
  Future<BaseResponseModel> signIn() async {
    await Future.delayed(const Duration(seconds: 3));
    return BaseResponseModel(
        status: 0, data: "Data", message: "Sign up Successfull");
  }

  @override
  Future<BaseResponseModel> addUserDetail() async {
    await Future.delayed(const Duration(seconds: 3));
    return BaseResponseModel(
        status: 0,
        data: "Data",
        message: '{"mail": "user@example.com", "password": "userPassword123"}');
  }
}
