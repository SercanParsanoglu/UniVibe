import 'package:uni_social/feature/base/base_service.dart';

class FakeService implements IService {
  @override
  Future<BaseResponseModel> requestForFriends() async {
    await Future.delayed(const Duration(seconds: 5));
    return BaseResponseModel(status: 0, data: "Data", message: "Successfull");
  }

  @override
  Future<BaseResponseModel> signIn() async {
    await Future.delayed(const Duration(seconds: 3));
    return BaseResponseModel(
        status: 0, data: "Data", message: "Sign ın Successfull");
  }

  @override
  Future<BaseResponseModel> signUp() async {
    await Future.delayed(const Duration(seconds: 3));
    return BaseResponseModel(
        status: 0, data: "Data", message: "Sign up Successfull");
  }
}
