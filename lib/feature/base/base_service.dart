abstract class IService {
  Future<BaseResponseModel> signUp();
  Future<BaseResponseModel> signIn();
  Future<BaseResponseModel> requestForFriends();
}

class BaseResponseModel {
  String? data;
  int? status;
  String? message;

  BaseResponseModel({this.data, this.status, this.message});
}
