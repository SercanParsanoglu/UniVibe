import 'package:mobx/mobx.dart';
import 'package:uni_social/feature/base/base_service.dart';
import 'package:uni_social/feature/model/sign_up/sign_up_req_model.dart';
import 'package:uni_social/feature/service/fake_service.dart';

import '../../locator.dart';
import '../model/user_model.dart';
import '../provider/cache_user_provider.dart';
part 'sign_up_view_model.g.dart';

enum SignUpStatus { busy, idle }

class SignUpViewModel = _SignUpViewModelBase with _$SignUpViewModel;

abstract class _SignUpViewModelBase extends FakeService with Store {
  FakeService fakeService = FakeService();
  
  @observable
  SignUpStatus _signUpStatus = SignUpStatus.idle;
  SignUpStatus get signUpStatus => _signUpStatus;
  
  @override
  Future<BaseResponseModel> signUp(SignUpReqModel signUpReqModel) async {
    
    _signUpStatus = SignUpStatus.busy;
    await fakeService.signUp(signUpReqModel);
    await locator.get<CacheUserProvider>().writeHive(UserModel(
        mail: signUpReqModel.mail, phone: signUpReqModel.phoneNumber));
    _signUpStatus = SignUpStatus.idle;

    return super.signUp(signUpReqModel);
  }
}
