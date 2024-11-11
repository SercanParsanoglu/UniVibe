import 'package:uni_social/feature/model/sign_up/sign_up_req_model.dart';

abstract class IService {
  Future<BaseResponseModel> signUp(SignUpReqModel signUpReqModel);
  Future<BaseResponseModel> signIn();
  Future<BaseResponseModel> requestForFriends();
  Future<BaseResponseModel> addUserDetail();
}

class BaseResponseModel {
  String? data;
  int? status;
  String? message;

  BaseResponseModel({this.data, this.status, this.message});
}
